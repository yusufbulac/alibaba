<cfcomponent output="false">
        <cfset this.name = "myApp">
        <cfset this.applicationTimeout = createTimespan(0, 2, 0, 0)>
        <cfset this.datasource = "alibabaDSN">
        <cfset this.customTagPaths = expandPath("/customTags")>
        <cfset this.sessionManagement = true>
        <cfset this.sessionTimeout = createTimespan(0, 0, 30, 0)>
        
        


    <cffunction  name="onApplicationStart" returntype="boolean">
    	<cfset application.routeService = createObject("component",'alibaba.components.routeService') />
        <cfset application.authService = createObject("component",'alibaba.components.authService') />
        <cfset application.homeModel = createObject("component",'alibaba.models.homeModel')/>
        <cfset application.editModel = createObject("component",'alibaba.models.editModel')/>
        <cfset application.addModel = createObject("component",'alibaba.models.addModel')/>
        <cfset application.loginModel = createObject("component",'alibaba.models.loginModel')/>
        <cfset application.baseDir = getDirectoryFromPath(getCurrentTemplatePath())>
        <cfset application.baseURL = "http#iif(CGI.SERVER_PORT_SECURE,"s","")#://#CGI.SERVER_NAME#"&":8500"&"#getDirectoryFromPath(cgi.SCRIPT_NAME)#">
        <cfreturn true>
    </cffunction>



    <cffunction  name="onRequestStart" returntype="boolean">
        <cfargument  name="targetPage" type="string" required="true">

        <cfif isDefined("url.restartApp")>
            <cfset this.onApplicationStart() />
        </cfif>

    

        <cfreturn true>
    </cffunction>


    <cffunction name="onMissingTemplate" returnType="boolean">
        <cfargument type="string" name="targetPage" required=true/>
        <cftry>
            <!--- Log all errors. --->
            <cflog type="error" text="Missing template: #Arguments.targetPage#">
            <!--- Display an error message. --->
            <cfoutput>
                <h3>#Arguments.targetPage# could not be found.</h3>
                <p>You requested a non-existent ColdFusion page.<br />
                Please check the URL.</p>
            </cfoutput>
            <cfreturn false />
            <!--- If an error occurs, return false and the default error
            handler will run. --->
        <cfcatch>
            <cfreturn false />
        </cfcatch>
        </cftry>
    </cffunction>


</cfcomponent>