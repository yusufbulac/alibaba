
<!--- SELECTED ANIMAL --->
<cfset selectedAnimalID = "" />
<cfif structKeyExists(url,'animalID')>
	<cfset selectedAnimalID = url.animalID>
</cfif>
<cfif structKeyExists(form,'selectAnimal') AND structKeyExists(form,'animalsID')>
	<cfset selectedAnimalID = form.AnimalsID />
</cfif>


<!--- SELECTED FEED --->
<cfset selectedFeedID = "" />
<cfif structKeyExists(url,'feedID')>
	<cfset selectedFeedID = url.feedID>
</cfif>
<cfif structKeyExists(form,'selectFeed') AND structKeyExists(form,'feedsID')>
	<cfset selectedFeedID = form.feedsID />
</cfif>

<!--- UPDATE ANIMAL --->
<cfif structKeyExists(form,'updateAnimal')>
	<cfset application.editModel.updateAnimal(form.animalsID,form.animalsName,form.animalsQuantity,form.animalsIsHaveMilk,form.animalsMilkQuantity,form.feedsID,form.animalsDailyFeed,form.animalsVet)>
</cfif>

<!--- UPDATE FEED --->
<cfif structKeyExists(form,'updateFeed')>
	<cfset application.editModel.updateFeed(form.feedsID,form.feedsName,form.feedsQuantity)>
</cfif>

<div class="container">
    <div class="row">
        <div class="col-10 col-sm-9 col-md-4 mx-auto">
        <h3>Hayvanları Düzenle</h3>
        <cfform>
            <div class="form-group">
                <label for="animalsID" class="text-muted">Düzenlemek istediğiniz hayvan türünü seçiniz.</label>
                <cfset animalsName=application.editModel.getAnimals()>
                <cfselect class="form-control mt-1" name="animalsID" id="animalsID" query="animalsName" value="AnimalsID" display="AnimalsName" queryPosition="below" selected="#selectedAnimalID#">
                    <option selected disabled>Hayvan Türünü Seçiniz</option>
                </cfselect>
            </div>
            <button type="submit" name="selectAnimal" class="btn btn-primary mt-2">Seç</button>
        </cfform>

        
        <br><hr>

        <h3>Yemleri Düzenle</h3>
        <cfform>
            <div class="form-group">
                <label for="animalsID" class="text-muted">Düzenlemek istediğiniz yem türünü seçiniz.</label>
                <cfset feedsName=application.editModel.getFeeds()>
                <cfselect class="form-control mt-1" name="feedsID" id="animalsID" query="feedsName" value="feedsID" display="feedsName" queryPosition="below">
                    <option selected disabled>Yem Türünü Seçiniz</option>
                </cfselect>
            </div>
            <button type="submit" name="selectFeed" class="btn btn-primary mt-2">Seç</button>
        </cfform>


        <hr><br>





        <!--- GET ANIMAL DETAIL - UPDATE FORM --->
        <cfif (structKeyExists(form,'selectAnimal') AND structKeyExists(form,'animalsID')) OR structKeyExists(url,'animalID')>
            <cfset animal=application.editModel.selectedAnimal(selectedAnimalID)>
            <cfform>
                <div class="form-group">
                    <cfinput type="hidden" class="form-control" id="animalsID" name="animalsID" value=#animal.AnimalsID# required>
                </div>
                <div class="form-group">
                    <label for="animalsName">Hayvan Türü</label>
                    <cfinput type="text" class="form-control" id="animalsName" name="animalsName" value=#animal.AnimalsName# required>
                </div>
                <div class="form-group">
                    <label for="animalsQuantity">Hayvan Sayısı</label>
                    <div class="input-group">
                        <cfinput type="text" class="form-control" id="animalsQuantity" name="animalsQuantity" value=#animal.AnimalsQuantity# required>
                        <div class="input-group-append">
                            <span class="input-group-text"> Adet </span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="animalsIsHaveMilk">Süt üretimi var mı?</label>
                    <cfselect class="form-control mt-1" name="animalsIsHaveMilk" id="animalsIsHaveMilk" required>
                        <option  value="0" selected>Hayır</option>
                        <option value="1" <cfif animal.AnimalsIsHaveMilk EQ 1>selected
                        </cfif>>Evet</option>
                    </cfselect>
                </div>
                <div class="form-group" id="milk-quantity">
                    <label for="animalsMilkQuantity">Günlük süt üretim miktarı</label>
                    <div class="input-group">
                        <cfinput type="number" class="form-control" id="animalsMilkQuantity" name="animalsMilkQuantity" value=#animal.AnimalsMilkQuantity# required>
                        <div class="input-group-append">
                            <span class="input-group-text"> Litre </span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="feedsID">Yem türü</label>
                    <cfselect class="form-control mt-1" name="feedsID" id="feedsID" query="feedsName" value="feedsID" display="feedsName" queryPosition="below">
                        <option selected disabled>Yem Türünü Seçiniz</option>
                    </cfselect>
                </div>
                <div class="form-group">
                    <label for="animalsDailyFeed">Günlük yem tüketim miktarı</label>
                    <div class="input-group">
                        <cfinput type="number" class="form-control" id="animalsDailyFeed" name="animalsDailyFeed" value=#animal.AnimalsDailyFeed# required>
                        <div class="input-group-append">
                                <span class="input-group-text"> Kilogram </span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="animalsVet">Veteriner Kontrol Tarihi</label>
                    <cfinput type="date" class="form-control" id="animalsVet" name="animalsVet" value="#dateFormat(animal.AnimalsVet,'yyyy-mm-dd')#" required>
                </div>
                <button type="submit" name="updateAnimal" class="btn btn-primary mt-2">Güncelle</button>
            </cfform>
        </cfif>


        <!--- GET FEED DETAIL - UPDATE FORM--->
        <cfif (structKeyExists(form,'selectFeed') AND structKeyExists(form,'feedsID')) OR structKeyExists(url,'feedID')>
            <cfset feed=application.editModel.selectedFeed(selectedFeedID)>
            <cfform>
                <div class="form-group">
                    <cfinput type="hidden" class="form-control" id="feedsID" name="feedsID" value=#feed.FeedsID# required>
                </div>
                <div class="form-group">
                    <label for="feedsName">Yem Adı</label>
                    <cfinput type="text" class="form-control" id="feedsName" name="feedsName" value=#feed.FeedsName# required>
                </div>
                <div class="form-group">
                    <label for="feedsQuantity">Yem Miktarı</label>
                    <div class="input-group">
                        <cfinput type="number" class="form-control" id="feedsQuantity" name="feedsQuantity" value=#feed.FeedsQuantity# required>
                        <div class="input-group-append">
                                <span class="input-group-text"> Kilogram </span>
                        </div>
                    </div>
                </div>
                <button type="submit" name="updateFeed" class="btn btn-primary mt-2">Güncelle</button>
            </cfform>
        </cfif>

        </div>
    </div>
</div>


<script type="text/javascript">
    

    <!--- #milk-quantity=0 and the display style is hidden if animal cant produce milk --->
    $('#animalsIsHaveMilk').change(function(){
        var isHaveMilk= $(this).val();
        if(isHaveMilk == 1){
            $('#milk-quantity').css('display', '');
        }else if(isHaveMilk == 0){
            $('#animalsMilkQuantity').val("0");
            $('#milk-quantity').hide();
        }           
    });

    var isHaveMilk = $('#animalsIsHaveMilk').val();
    if(isHaveMilk === "0"){
        document.getElementById("animalsMilkQuantity").value = "0";
        document.getElementById("milk-quantity").style.display = "none";
    }



</script>
