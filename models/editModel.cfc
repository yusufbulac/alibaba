<cfcomponent>
    <!--- GET ANIMALS LIST--->
	<cffunction name="getAnimals" access="public" output="false" returntype="query">
		<cfquery  name="animalsName">
			SELECT AnimalsName,AnimalsID FROM ANIMALS
		</cfquery>
		<cfreturn animalsName />
	</cffunction>

	<!--- GET FEEDS LIST--->
	<cffunction name="getFeeds" access="public" output="false" returntype="query">
		<cfquery  name="feeds">
			SELECT * FROM FEEDS
		</cfquery>
		<cfreturn feeds />
	</cffunction>

    <!--- GET ANIMAL DETAIL --->
    <cffunction name="selectedAnimal" access="public" output="false" returntype="query">
        <cfargument  name="selectedAnimal" type="numeric" required="true" hint="ID of the selected animal">
		<cfquery  name="selectedAnimal">
			SELECT * FROM ANIMALS WHERE AnimalsID = <cfqueryparam value="#arguments.selectedAnimal#" cfsqltype="cf_sql_integer">
		</cfquery>
		<cfreturn selectedAnimal />
	</cffunction>

	<!--- GET FEED DETAIL --->
    <cffunction name="selectedFeed" access="public" output="false" returntype="query">
        <cfargument  name="selectedFeed" type="numeric" required="true" hint="ID of the selected feed">
		<cfquery  name="selectedFeed">
			SELECT * FROM FEEDS WHERE FeedsID = <cfqueryparam value="#arguments.selectedFeed#" cfsqltype="cf_sql_integer">
		</cfquery>
		<cfreturn selectedFeed />
	</cffunction>

    <!--- ANIMAL UPDATE --->
    <cffunction name="updateAnimal" access="public" output="false" returntype="void">
        <cfargument name="AnimalsID" type="numeric" required="true">
        <cfargument name="AnimalsName" type="string" required="true">
        <cfargument name="AnimalsQuantity" type="numeric" required="true">
        <cfargument name="AnimalsIsHaveMilk" type="numeric" required="true">
        <cfargument name="AnimalsMilkQuantity" type="numeric" required="true">
        <cfargument name="FeedsID" type="numeric" required="true">
        <cfargument name="AnimalsDailyFeed" type="numeric" required="true">
        <cfargument name="AnimalsVet" type="date" required="true">
		<cfquery>
			UPDATE ANIMALS
			SET
			AnimalsName = <cfqueryparam value="#arguments.AnimalsName#" cfsqltype="cf_sql_varchar" />,
			AnimalsQuantity = <cfqueryparam value="#arguments.AnimalsQuantity#" cfsqltype="cf_sql_integer" />,
			AnimalsIsHaveMilk = <cfqueryparam value="#arguments.AnimalsIsHaveMilk#" cfsqltype="cf_sql_tinyint" />,
			AnimalsMilkQuantity = <cfqueryparam value="#arguments.AnimalsMilkQuantity#" cfsqltype="cf_sql_integer" />,
			FeedsID = <cfqueryparam value="#arguments.FeedsID#" cfsqltype="cf_sql_integer" />, 
			AnimalsDailyFeed = <cfqueryparam value="#arguments.AnimalsDailyFeed#" cfsqltype="cf_sql_integer" />, 
			AnimalsVet = <cfqueryparam value="#arguments.AnimalsVet#" cfsqltype="cf_sql_date" />
			WHERE AnimalsID = <cfqueryparam value="#arguments.AnimalsID#" cfsqltype="cf_sql_integer" />


		</cfquery>
	</cffunction>


	<!--- FEED UPDATE --->
    <cffunction name="updateFeed" access="public" output="false" returntype="void">
        <cfargument name="FeedsID" type="numeric" required="true">
        <cfargument name="FeedsName" type="string" required="true">
        <cfargument name="FeedsQuantity" type="numeric" required="true">
		<cfquery>
			UPDATE FEEDS
			SET
			FeedsName = <cfqueryparam value="#arguments.FeedsName#" cfsqltype="cf_sql_varchar" />,
			FeedsQuantity = <cfqueryparam value="#arguments.FeedsQuantity#" cfsqltype="cf_sql_integer" />
			WHERE FeedsID = <cfqueryparam value="#arguments.FeedsID#" cfsqltype="cf_sql_integer" />



		</cfquery>
	</cffunction>
</cfcomponent>

