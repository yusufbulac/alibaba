<cfset route = "">
<cfset path = "views/home.cfm">
<cfif isDefined("url.route")>
    <cfset route = url.route>
    <cfset path=application.routeService.getRoute(route)>
</cfif>
<cfset application.authService.isLogged()>

<cfinclude  template="views/header.cfm">
<cfinclude  template="#path#">
<cfinclude  template="views/footer.cfm">