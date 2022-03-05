
    <div class="container">
        <div class="row mb-5">
            <div class="col-md-8 mx-auto">
                <small class="text-muted">*Günlük üretilen toplam süt</small><br>
                <small class="text-muted">**Günlük tüketilen toplam yem</small>
                <table class="table table-bordered table-striped table-hover mt-2">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Hayvan Türü</th>
                            <th scope="col">Hayvan Sayısı
                                <small class="text-muted">(Adet)<small>
                            </th>
                            <th scope="col">Toplam Süt<br> Üretimi*
                                <small class="text-muted">(Litre)<small>
                            </th>
                            <th scope="col">Yem Türü</th>
                            <th scope="col">Toplam Tüketilen<br> Yem**
                                <small class="text-muted">(Kg)<small>
                            </th>
                            <th scope="col">Düzenle</th>
                        </tr>
                    </thead>
                    <tbody>
                        <cfset animals=application.homeModel.getAnimals()>
                        <cfset index = 1>
                        <cfset totalAnimals = 0>
                        <cfset totalMilk = 0>
                        <cfset totalFeed= 0>
                        <cfset totalFeeds = structNew()>
                        <cfloop query="animals">
                            <cfoutput>
                                <tr>
                                    <th scope="row">#index#</th>
                                    <td>#animals.AnimalsName#</td>
                                    <td>#animals.AnimalsQuantity#</td>
                                    <td>#animals.AnimalsMilkQuantity*animals.AnimalsQuantity#</td>
                                    <td>#animals.FeedsName#</td>
                                    <td>#animals.AnimalsDailyFeed*animals.AnimalsQuantity#</td>
                                    <td><a href="?route=edit&animalID=#animals.AnimalsID#"><button type="button" class="btn btn-primary btn-sm">✓</button></a></td>
                                    <cfset index+=1>
                                    <cfset totalAnimals += animals.AnimalsQuantity>
                                    <cfset totalMilk += animals.AnimalsMilkQuantity*animals.AnimalsQuantity>
                                    <cfset totalFeed+= animals.AnimalsDailyFeed*animals.AnimalsQuantity>
                                </tr>
                            </cfoutput>
                            <cfset feedsID = animals.FeedsID>
                            <cfset animalsQuantity = animals.AnimalsQuantity>
                            <cfset animalsDailyFeed = animals.AnimalsDailyFeed>
                            <cfset total = animalsQuantity*animalsDailyFeed>
                            <cfif structKeyExists(totalFeeds, feedsID)>
                                <cfset StructUpdate(totalFeeds,feedsID,totalFeeds[feedsID]+total)>
                            <cfelseif structKeyExists(totalFeeds, feedsID) EQ FALSE>
                                <cfset structInsert(totalFeeds, feedsID, total,false)>                               
                            </cfif >
                        </cfloop>
                        <cfoutput> 
                            <td></td>
                            <td><b>Toplam :</b></td>
                            <td>#totalAnimals#</td>
                            <td>#totalMilk#</td>
                            <td></td>
                            <td>#totalFeed#</td>
                            <td></td>
                        </cfoutput>

                    </tbody>
                </table>
            </div>        
        </div>

        <hr><br>

        <div class="row">
            <div class="col-md-8 mx-auto">
                <table class="table table-bordered table-striped table-hover mt-2">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Yem Türü</th>
                            <th scope="col">Yem Stoğu
                                <small class="text-muted">(Kg)<small>
                            </th>
                            <th scope="col">Tahimini Stok Bitişi
                                <small class="text-muted">(Gün)<small>
                            </th>
                            <th scope="col">Düzenle</th>
                        </tr>
                    </thead>
                    <tbody>
                        <cfset feeds=application.homeModel.getFeeds()>
                        <cfset index = 1>
                        <cfloop query="feeds">
                            <cfoutput>
                                <tr>
                                    <th scope="row">#index#</th>
                                    <td>#feeds.FeedsName#</td>
                                    <td>#feeds.FeedsQuantity#</td>
                                    <td>
                                        <cfloop collection="#totalFeeds#" item="item">
                                            <cfif item EQ feeds.FeedsID>
                                                <cfoutput>
                                                    #int(feeds.FeedsQuantity/totalFeeds[item])#
                                                </cfoutput>
                                            </cfif>
                                        </cfloop>
                                    </td>
                                    <td><a href="?route=edit&feedID=#feeds.FeedsID#"><button type="button" class="btn btn-primary btn-sm">✓</button></a></td>
                                    <cfset index+=1>
                                </tr>
                            </cfoutput>

                        </cfloop>
                    </tbody>
                </table>
            </div>        
        </div>
    </div>

