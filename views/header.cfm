<cfprocessingdirective pageEncoding="UTF-8">
<cfset setLocale("tr_TR")>



<html lang="tr">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        
        <link rel="stylesheet" href="assets/css/main.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <title>Ali Baba'nın Çitliği</title>
    </head>
    <body>

        <nav class="navbar navbar-expand-md navbar-light bg-light fixed-top mb-5 border-bottom border-dark">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03"
                    aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand" href="#">Ali Babanın Çiftliği</a>
                <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                    <cfoutput>
                        <ul class="navbar-nav me-auto mb-2 mb-md-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#application.baseURL#?route=home">Ana Sayfa</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#application.baseURL#?route=edit">Düzenle</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#application.baseURL#?route=add">Ekle</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#application.baseURL#?route=excel">Excel</a>
                            </li>
                        </ul>
                    </cfoutput>
                </div>
                <div>
                    <cfif structKeyExists(session, "loggedinuser")>
                        <cfoutput>
                            #session.loggedinuser.userName# | <a href="#application.baseURL#?route=logout"><button class="btn btn-danger">Çıkış</button></a>
                        </cfoutput>
                    </cfif>
                    
                
                </div>
            </div>
        </nav>
        <div class="row" style="height:100px">
        </div>