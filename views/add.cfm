<cfset feedsName=application.editModel.getFeeds()>

<!--- UPDATE ANIMAL --->
<cfif structKeyExists(form,'addAnimal')>
	<cfset application.addModel.addAnimal(form.animalsName,form.animalsQuantity,form.animalsIsHaveMilk,form.animalsMilkQuantity,form.feedsID,form.animalsDailyFeed,form.animalsVet)>
</cfif>

<!--- UPDATE FEED --->
<cfif structKeyExists(form,'addFeed')>
	<cfset application.addModel.addFeed(form.feedsName,form.feedsQuantity)>
</cfif>











<div class="container">
    <div class="row">
        <div class="col-10 col-sm-9 col-md-4 mx-auto">


        <!--- ADD ANIMAL FORM --->
        <h3>Yeni Hayvan Ekle</h3>
        <cfform>
            <div class="form-group">
                <label for="animalsName">Hayvan Türü</label>
                <cfinput type="text" class="form-control" id="animalsName" name="animalsName" required>
            </div>
            <div class="form-group">
                <label for="animalsQuantity">Hayvan Sayısı</label>
                <div class="input-group">
                    <cfinput type="text" class="form-control" id="animalsQuantity" name="animalsQuantity" required>
                    <div class="input-group-append">
                        <span class="input-group-text"> Adet </span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="animalsIsHaveMilk">Süt üretimi var mı?</label>
                <cfselect class="form-control mt-1" name="animalsIsHaveMilk" id="animalsIsHaveMilk" required>
                    <option  value="0" selected>Hayır</option>
                    <option value="1">Evet</option>
                </cfselect>
            </div>
            <div class="form-group" id="milk-quantity">
                <label for="animalsMilkQuantity">Günlük süt üretim miktarı</label>
                <div class="input-group">
                    <cfinput type="number" class="form-control" id="animalsMilkQuantity" name="animalsMilkQuantity">
                    <div class="input-group-append" required>
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
                    <cfinput type="number" class="form-control" id="animalsDailyFeed" name="animalsDailyFeed" required>
                    <div class="input-group-append">
                            <span class="input-group-text"> Kilogram </span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="animalsVet">Veteriner Kontrol Tarihi</label>
                <cfinput type="date" class="form-control" id="animalsVet" name="animalsVet" required>
            </div>
            <button type="submit" name="addAnimal" class="btn btn-primary mt-2">Ekle</button>
        </cfform>

        <br>
        <hr>
        <br>

        <!--- ADD FEED FORM --->
        <h3>Yeni Yem Ekle</h3>
        <cfform>
            <div class="form-group">
                <label for="feedsName">Yem Adı</label>
                <cfinput type="text" class="form-control" id="feedsName" name="feedsName" required>
            </div>
            <div class="form-group">
                <label for="feedsQuantity">Yem Miktarı</label>
                <div class="input-group">
                    <cfinput type="number" class="form-control" id="feedsQuantity" name="feedsQuantity" required>
                    <div class="input-group-append">
                            <span class="input-group-text"> Kilogram </span>
                    </div>
                </div>
            </div>
            <button type="submit" name="addFeed" class="btn btn-primary mt-2">Ekle</button>
        </cfform>

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
