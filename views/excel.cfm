<!--
    src => dosya yolu
    sheetname => sayfa adı
-->




<cfset showForm = true>
<cfset dest = "#application.baseDir#assets/uploads/xls/">
<cfif structKeyExists(form, "submitExcel") and len(form.fileExcel)>	

	<cffile action="upload" destination="#dest#" filefield="fileExcel" result="upload" nameconflict="makeunique">

	<cfif upload.fileWasSaved>
		<cfset theFile = upload.serverDirectory & "/" & upload.serverFile>
		<cfif isSpreadsheetFile(theFile)>
			<cfspreadsheet action="read" src="#theFile#" query="data" headerrow="1">
			<!---
			<cffile action="delete" file="#theFile#">
			--->
			<cfset showForm = false>
		<cfelse>
			<cfset errors = "Lütfen xls veya xlsx uzantılı dosya yükleyin.">
			<cffile action="delete" file="#theFile#">
		</cfif>
	<cfelse>
		<cfset errors = "Dosya düzgün yüklenmedi.">	
	</cfif>

<cfelseif structKeyExists(form, "listExcel") >
	<cfspreadsheet action="read" src="#dest#/#form.filelist#" query="data" headerrow="1">
	<cfset showForm = false>
</cfif>


<div class="container">
	<div class="row">

		<!--- Add xls  --->
		<div class="col-md-4 mx-auto border-end">

			<cfif structKeyExists(variables, "errors")>
				<cfoutput>
				<p>
				<b>Error: #variables.errors#</b>
				</p>
				</cfoutput>
			</cfif>
			
			<cfform enctype="multipart/form-data" method="post">
				<div class="mb-3">
					<label for="fileExcel" class="form-label">Yüklemek istediğiniz dosyayı seçiniz.</label>
					<input class="form-control" type="file" id="fileExcel" name="fileExcel">
					<small class="text-muted">*Dosya formatı ".xls" veya ".xlsx" olmalıdır.</small>
				</div>
				<button type="submit" name="submitExcel" id="submitExcel" class="btn btn-primary mt-2">Ekle</button>
			</cfform>


		</div>

		<!--- Select xls  --->
		<div class="col-md-4 mx-auto">
			<cfdirectory action="list" directory="#application.baseDir#/assets/uploads/xls/" recurse="false" name="myList">
			<!---
			<cfdump var="#myList#">
			--->
			<cfform>
				<div class="form-group">
                    <label for="fileList">Yüklü Dosyalar</label>
                    <cfselect class="form-control mt-1" name="fileList" id="fileList" query="myList" value="Name" display="Name" queryPosition="below">
                        <option selected disabled>Görüntülemek istediğiniz dosyayı seçiniz</option>
                    </cfselect>
                </div>
				<button type="submit" name="listExcel" id="listExcel" class="btn btn-primary mt-2">Seç</button>
			</cfform>
		</div>
	</div>

	<hr>

	<div class="row">

		
		<!--- Show xls  --->
		<cfif structKeyExists(variables, "data")>
			<cfset metadata = getMetadata(data)>
			<cfset colList = "">
			<cfloop index="col" array="#metadata#">
				<cfset colList = listAppend(colList, col.name)>
			</cfloop>
			
			<cfif data.recordCount is 1>
				<p>
					Tabloda veri yok.
				</p>
			<cfelse>
				<div class="row">
					<div class="col-md-6 mx-auto">
						<table class="table table-bordered table-striped table-hover mt-2">
							<tr class="ssHeader">
								<cfloop index="c" list="#colList#">
									<cfoutput><th scope="col">#c#</th></cfoutput>
								</cfloop>
							</tr>
							<cfoutput query="data" startRow="2">
								<tr>
								<cfloop index="c" list="#colList#">
									<td>#data[c][currentRow]#</td>
								</cfloop>
								</tr>					
							</cfoutput>
						</table>
					</div>
				</div>
			</cfif>
		</cfif>

	</div>
		



</div>











