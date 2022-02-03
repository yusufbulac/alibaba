<cfcomponent>
	<cffunction name="getAnimals" access="public" output="false" returntype="query">
		<cfquery  name="animals">
			SELECT * FROM ANIMALS INNER JOIN FEEDS ON ANIMALS.FeedsID=FEEDS.FeedsID
		</cfquery>
		<cfreturn animals />
	</cffunction>


	<cffunction name="getFeeds" access="public" output="false" returntype="query">
		<cfquery  name="feeds">
			SELECT * FROM FEEDS 
		</cfquery>
		<cfreturn feeds />
	</cffunction>
</cfcomponent>