<cfcomponent>

    <!--- ADD ANIMAL --->
    <cffunction name="addAnimal" access="public" output="false" returntype="void">
        <cfargument name="AnimalsName" type="string" required="true">
        <cfargument name="AnimalsQuantity" type="numeric" required="true">
        <cfargument name="AnimalsIsHaveMilk" type="numeric" required="true">
        <cfargument name="AnimalsMilkQuantity" type="numeric" required="true">
        <cfargument name="FeedsID" type="numeric" required="true">
        <cfargument name="AnimalsDailyFeed" type="numeric" required="true">
        <cfargument name="AnimalsVet" type="date" required="true">
		<cfquery>
			INSERT INTO ANIMALS
            (AnimalsName,AnimalsQuantity,AnimalsIsHaveMilk,AnimalsMilkQuantity,FeedsID,AnimalsDailyFeed,AnimalsVet)
			VALUES
            (
                <cfqueryparam value="#arguments.AnimalsName#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.AnimalsQuantity#" cfsqltype="cf_sql_integer" />,
                <cfqueryparam value="#arguments.AnimalsIsHaveMilk#" cfsqltype="cf_sql_tinyint" />,
                <cfqueryparam value="#arguments.AnimalsMilkQuantity#" cfsqltype="cf_sql_integer" />,
                <cfqueryparam value="#arguments.FeedsID#" cfsqltype="cf_sql_integer" />,
                <cfqueryparam value="#arguments.AnimalsDailyFeed#" cfsqltype="cf_sql_integer" />,
                <cfqueryparam value="#arguments.AnimalsVet#" cfsqltype="cf_sql_date" />
            )


		</cfquery>
	</cffunction>



    	<!--- ADD FEED --->
    <cffunction name="addFeed" access="public" output="false" returntype="void">
        <cfargument name="FeedsName" type="string" required="true">
        <cfargument name="FeedsQuantity" type="numeric" required="true">
		<cfquery>
			INSERT INTO FEEDS 
			(FeedsName,FeedsQuantity)
            VALUES
            (
                <cfqueryparam value="#arguments.FeedsName#" cfsqltype="cf_sql_varchar" />,
                <cfqueryparam value="#arguments.FeedsQuantity#" cfsqltype="cf_sql_integer" />
            )
		</cfquery>
	</cffunction>
</cfcomponent>