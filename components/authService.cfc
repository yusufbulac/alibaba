<cfcomponent>
    <cffunction  name="isLogged"  access="public" output="false">
        <cfif NOT isUserLoggedIn()>
            <cfif structKeyExists(url, "route") AND url.route NEQ "login">
                <cflocation  url="#application.baseURL#?route=login">
            </cfif>
        <cfelse>
            <cfif structKeyExists(url, "route") AND url.route EQ "login">
                <cflocation url="#application.baseURL#?route=home">
            </cfif>
        </cfif>
    </cffunction>

</cfcomponent>