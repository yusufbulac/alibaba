<cfif url.route EQ "logout">
        <cfset application.loginModel.doLogout()>
</cfif>


<cfif structKeyExists(form, "submitLogin")>
        <cfset isUserLoggedIn=application.loginModel.doLogin(form.userEmail,form.userPassword)>
        <cfif isUserLoggedIn>
            <cflocation  url="#application.baseURL#?route=home">
        </cfif>
</cfif>



<main class="form-signin mt-5">
    <div class="container mx-auto">
        <cfform class="text-center">
            <h3 class="logo-title border rounded-pill py-2">
                Ali Baba'nın Çiftliği
            </h3>
            
            <h1 class="h3 mb-3 fw-normal">Lütfen giriş yapınız</h1>

            <div class="form-floating">
            <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="name@example.com">
            <label for="userEmail">Email adres</label>
            </div>
            <div class="form-floating">
            <input type="password" name="userPassword" id="userPassword" class="form-control"  placeholder="Password">
            <label for="userPassword">Password</label>
            </div>
            <button class="w-100 btn btn-lg btn-primary mt-3" name="submitLogin" id="submitLogin" type="submit">Giriş Yap</button>
            <p class="mt-5 mb-3 text-muted">&copy; 2022</p>
        </cfform>
    </div>
</main>




