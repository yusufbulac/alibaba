<cfcomponent>

    <cffunction  name="doLogin" access="public" output="false" returntype="boolean">
        <cfargument  name="userEmail" type="string" required="true">
        <cfargument  name="userPassword" type="string" required="true">

        <cfset isUserLoggedin = false>

        <cfquery name="loginUser">
            SELECT*FROM USERS WHERE UsersEmail='#arguments.userEmail#' AND UsersPassword='#arguments.userPassword#'
        </cfquery>

        <cfif loginUser.recordCount EQ 1>
            <cflogin>
                <cfloginuser  name="#loginUser.UsersName#"  password="#loginUser.UsersPassword#"  roles="admin">
            </cflogin>
            <cfset session.LoggedInUser = {'userEmail'=loginUser.UsersEmail,"userName"=loginUser.UsersName,"userID"=loginUser.UsersID}>
            <cfset isUserLoggedin = true>
        </cfif>
        <cfreturn isUserLoggedIn>
    </cffunction>

    <cffunction  name="doLogout" access="public" output="false" returntype="void">
        <cfset structdelete(session,"LoggedInUser")>
        <cflogout>
    </cffunction>
</cfcomponent>