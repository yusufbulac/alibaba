<cfcomponent output="false" hint="Route component.">

    <cffunction  name="getRoute" returntype="string" access="public">
        <cfargument  name="route" type="string" required="true">

        <cfif arguments.route EQ "login">
            <cfreturn "views/login.cfm">
        <cfelseif arguments.route EQ "logout">
            <cfreturn "views/login.cfm">
        <cfelseif arguments.route EQ "edit">
            <cfreturn "views/edit.cfm">
        <cfelseif arguments.route EQ "add">
            <cfreturn "views/add.cfm">
        <cfelseif arguments.route EQ "import">
            <cfreturn "views/import.cfm">
        <cfelseif arguments.route EQ "excel">
            <cfreturn "views/excel.cfm">
        <cfelse>
            <cfreturn "views/home.cfm">
        </cfif>
        <cfreturn true>
    </cffunction>
</cfcomponent>