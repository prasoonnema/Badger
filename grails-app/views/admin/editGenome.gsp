<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name='layout' content='main'/>
  <title>${grailsApplication.config.projectID} admin</title>
  <parameter name="admin" value="selected"></parameter>
  
 <script>
  function demoData(sp){
  	if (sp == "badger"){
		$("#dir").val("M_meles");
		//$("#trans").val("trans.fa"); $("#trans_v").val("1.1"); $("#trans_d").val("UniGenes"); $("select[name='trans_c']").val("n");
		$("#genome").val("M_meles.genome.100.fa"); $("#genome_v").val("M meles 1.0"); $("#genome_d").val("The genome of M. meles has not yet been sequenced, this is just an example data set."); $("select[name='genome_c']").val("n");
		$("#genes").val("M_meles_1.100.gff"); $("#genes_v").val("1.1"); $("#genes_d").val("A GFF3 file generated by some gene prediction software");
		$("#mrna_trans").val("M_meles_1.transcripts.100.fa"); $("#mrna_trans_v").val("1.1"); $("#mrna_trans_d").val("A set of transcripts based on the predicted genes");
		$("#mrna_pep").val("M_meles_1.proteins.100.fa"); $("#mrna_pep_v").val("1.1"); $("#mrna_pep_d").val("A set of proteins based on the predicted genes");
	}
	if (sp == "badger2"){
		$("#genes").val("M_meles_2.100.gff"); $("#genes_v").val("1.2"); $("#genes_d").val("Another GFF3 file generated by some gene prediction software");
		$("#mrna_trans").val("M_meles_2.transcripts.100.fa"); $("#mrna_trans_v").val("1.2"); $("#mrna_trans_d").val("A set of transcripts based on the predicted genes");
		$("#mrna_pep").val("M_meles_2.proteins.100.fa"); $("#mrna_pep_v").val("1.2"); $("#mrna_pep_d").val("A set of proteins based on the predicted genes");
	}
  }
  </script>
  
  </head>

  <body>
<div class="bread"><g:link action="home">Admin</g:link> > <g:link action="home">Home</g:link> > <g:link action="editSpecies" params="${[Gid:genome.meta.id]}"><i>${genome.meta.genus} ${genome.meta.species}</i></g:link> > Edit genome </div>
  
<h1>Edit genome data:</h1>

<g:form action="editedGenome">

<table>
	<tr>
		<td width="45%"><b>Date (leave blank for today's date)</b><font color="red">*</font><br>
			<g:textField value="${formatDate(format:'dd/MM/yyyy',date:genome.dateString)}" name="genome_date" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
		</td>
		<td width="50%"><b>Version (a unique ID for the genome)</b><font color="red">*</font><br>
			<g:textField value="${genome.gversion}" name="genome_version" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
		</td>
	</tr>
</table>	
<p><b>URL of Gbrowse2 instance</b></p>
<g:textField value="${genome.gbrowse}" name="gbrowse" style="width: 98%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/><br><br>
<br>
<input type = "hidden" name="id" value="${genome.id}">
<input class="mybuttons" type="button" value="Update genome data" onclick="submit()" >
</g:form>
<hr size = 5 color="green" width="100%" style="margin-top:10px"><br>

<g:if test="${genome.files.anno.size() > 1}">
	<h1>Add / edit / delete gene annotation data:</h1>
	<table class="compact">
	<g:each var="f" in="${genome.files.sort({it.file_name})}">
		<g:if test="${f.file_type == 'Genes'}">
			<g:if test="${f.anno.size() > 0}">
				<tr><td>GFF file <b>${f.file_name}</b> has ${f.anno.size()} annotation files:</td></tr>
				<tr><td>Click <g:link action="addAnno" params="${[gid:f.id]}">here</g:link> to add more</td></tr>
				<tr><td>
				<table class="compact">
				<g:each var="a" in="${f.anno.sort({it.id})}">
	   				<tr><td>
	   					<div class="inline">
	   						<g:form action= "editAnno" params="[gid: a.id]" >
	    						<a href="#" onclick="parentNode.submit()" title="Edit file"><img src="${resource(dir: 'images', file: 'edit-icon.png')}" width="15px"/></a>
	    					</g:form>  	
	    					<g:form action="deleteAnno" params="[gid: a.id]" >
	    						<a href="#" onclick="parentNode.submit()" title="Delete file"><img src="${resource(dir: 'images', file: 'delete-icon.png')}" width="15px"/></a>
	    					</g:form> 	
	    				</div>
      				</td><td>${a.source}</td><td><b>${a.anno_file}</td></tr>
      			</g:each>
      			</table>
      			</td></tr>
      		</g:if>
      		<g:else>
      			<tr><td>GFF file</td><td><b>${f.file_name}</b> has no annotations, <g:link action="addAnno" params="${[gid:f.id]}">add some</g:link></td></tr>
      		</g:else>
      		
      	</g:if>
   	 </g:each>
	</table>
<hr size = 5 color="green" width="100%" style="margin-top:10px"><br>
</g:if>

<g:if test="${genome.files}">
	<table class="compact">
	<h1>Edit / delete data file information:</h1>
	<g:each var="f" in="${genome.files.sort({it.file_type})}">
	   <tr><td>
	   <div class="inline">
	   		<g:form action= "editFile" params="[fid: f.id]" >
	    		<a href="#" onclick="parentNode.submit()" title="Edit file"><img src="${resource(dir: 'images', file: 'edit-icon.png')}" width="15px"/></a>
	    	</g:form>  	
	    	<g:if test="${f.file_type == 'Genes' || f.file_type == 'Genome'}">
				<g:form action="deleteFile" params="[fid: f.id]" >
					<a href="#" onclick="parentNode.submit()" title="Delete file"><img src="${resource(dir: 'images', file: 'delete-icon.png')}" width="15px"/></a>
				</g:form> 
			</g:if>	
	    </div>
      		</td><td>${f.file_type}:</td><td><b>${f.file_name}</b></td></tr>
   	   </g:each>
</table>
<hr size = 5 color="green" width="100%" style="margin-top:10px"><br>
</g:if>

<br>

<g:if test="${genome.files.size()<1}">
	<g:form action="addedFiles" name="addFiles">
	<div class="inline">
		<h1>Add new data file information for the genome:</h1> Examples: 
		<a href = "javascript:void(0)" onclick="demoData('badger')">M. meles </a>
	</div><br>
	
		<h2><b>Data files</b></h2>	
		<p><b>Location (directory within data folder)</b><font color="red">*</font></p>
		<g:textField name="dir" style="width: 98%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/><br>
		<table width=100%>
			<tr>
				<td width="40%"><b>Genome (FASTA file)</b><font color="red">*</font><br>
					<g:textField name="genome" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
				</td>
				<td width="5%"><b>Version</b><font color="red">*</font><br>
					<g:textField name="genome_v" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
				</td>
				<td width="5%"><b>Coverage</b><br>
					<select name="genome_c">
						<option selected="selected" value="n">No</option>
						<option value="y">Yes</option>				
					</select>
				</td>
				<td width="40%"><b>Description</b><br>
					<g:textField name="genome_d" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
				</td>
				<td width="5%"><b>Search</b><br><select name="search_genome">
					<option value="pub">Public</option>
					<option value="priv">Private</option>
				</select></td>
				<td width="5%"><b>BLAST</b><br><select name="blast_genome">
					<option value="pub">Public</option>
					<option value="priv">Private</option>
				</select></td>	
				<td width="5%"><b>Download</b><br><select name="down_genome">
					<option value="pub">Public</option>
					<option value="priv">Private</option>
				</select></td>
			</tr>
			<tr>
				<td width="15%"><b>Genes (GFF3 file)</b><br>
					<g:textField name="genes" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
				</td>
				<td width="10%"><b>Version</b><br>
					<g:textField name="genes_v" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
				</td>
				<td colspan=2><b>Description</b><br>
					<g:textField name="genes_d" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
				</td>
				<td width="5%"><br>n/a</td>
				<td width="5%"><br>n/a</td>
				<td width="5%"><br><select name="down_genes">
					<option value="pub">Public</option>
					<option value="priv">Private</option>
				</select></td>
			</tr>
			<tr>
				<td width="15%"><b>mRNA transcripts (FASTA file)</b><br>
					<g:textField name="mrna_trans" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
				</td>
				<td width="10%"><b>Version</b><br>
					<g:textField name="mrna_trans_v" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
				</td>
				<td colspan=2><b>Description</b><br>
					<g:textField name="mrna_trans_d" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
				</td>
				<td width="5%"><br>n/a</td>
				<td width="5%"><br><select name="blast_mrna">
					<option value="pub">Public</option>
					<option value="priv">Private</option>
				</select></td>	
				<td width="5%"><br><select name="down_mrna">
					<option value="pub">Public</option>
					<option value="priv">Private</option>
				</select></td>
			</tr>
			<tr>
				<td width="15%"><b>Peptide sequences (FASTA file)</b><br>
					<g:textField name="mrna_pep" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
				</td>
				<td width="10%"><b>Version</b><br>
					<g:textField name="mrna_pep_v" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
				</td>
				<td colspan=2><b>Description</b><br>
					<g:textField name="mrna_pep_d" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
				</td>
				<td width="5%"><br>n/a</td>
				<td width="5%"><br><select name="blast_pep">
					<option value="pub">Public</option>
					<option value="priv">Private</option>
				</select></td>	
				<td width="5%"><br><select name="down_pep">
					<option value="pub">Public</option>
					<option value="priv">Private</option>
				</select></td>
			</tr>
		</table>
		
		<input type="hidden" name="gid" value="${genome.id}">
		<input class="mybuttons" type="button" value="Add new file set" onclick="submit()" >
		<hr size = 5 color="green" width="100%" style="margin-top:10px"><br>
		
	</g:form>
</g:if>

<g:if test="${'Genome' in genome.files.file_type}">
	<div class="inline">
		<h1>Add another set of gene files to the genome:</h1> Examples: 
		<a href = "javascript:void(0)" onclick="demoData('badger2')">M. meles 2</a>
	</div><br>
	
	<g:form action="addedFiles" name="extraGff">
		<input type="hidden" name="extra" value="${genome.files.find({it.file_type == 'Genome'}).id}">	
		<table width=100%>	
			<tr>
				<td width="25%"><b>Genes (GFF3 file)</b><br>
					<g:textField name="genes" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
				</td>
				<td width="10%"><b>Version</b><br>
					<g:textField name="genes_v" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
				</td>
				<td width="50"><b>Description</b><br>
					<g:textField name="genes_d" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
				</td>
				<td width="5%"><b>Search</b><br><select name="search_genes">
					<option value="pub">Public</option>
					<option value="priv">Private</option>
				</select></td>
				<td width="5%"><b>BLAST</b><br>n/a</td>
				<td width="5%"><b>Download</b><br><select name="down_genes">
					<option value="pub">Public</option>
					<option value="priv">Private</option>
				</select></td>
			</tr>
			<tr>
				<td width="25%"><b>mRNA transcripts (FASTA file)</b><br>
					<g:textField name="mrna_trans" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
				</td>
				<td width="10%"><b>Version</b><br>
					<g:textField name="mrna_trans_v" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
				</td>
				<td width="50"><b>Description</b><br>
					<g:textField name="mrna_trans_d" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
				</td>
				<td width="5%"><br>n/a</td>
				<td width="5%"><br><select name="blast_mrna">
					<option value="pub">Public</option>
					<option value="priv">Private</option>
				</select></td>	
				<td width="5%"><br><select name="down_mrna">
					<option value="pub">Public</option>
					<option value="priv">Private</option>
				</select></td>
			</tr>
			<tr>
				<td width="25%"><b>Peptide sequences (FASTA file)</b><br>
					<g:textField name="mrna_pep" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
				</td>
				<td width="10%"><b>Version</b><br>
					<g:textField name="mrna_pep_v" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
				</td>
				<td width="50"><b>Description</b><br>
					<g:textField name="mrna_pep_d" style="width:100%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/>
				</td>
				<td width="5%"><br>n/a</td>
				<td width="5%"><br><select name="blast_pep">
					<option value="pub">Public</option>
					<option value="priv">Private</option>
				</select></td>	
				<td width="5%"><br><select name="down_pep">
					<option value="pub">Public</option>
					<option value="priv">Private</option>
				</select></td>
			</tr>
		</table>
		
		<input type="hidden" name="gid" value="${genome.id}">
		<input class="mybuttons" type="button" value="Add new gene data" onclick="submit()" >
		<hr size = 5 color="green" width="100%" style="margin-top:10px"><br>
		
	</g:form>
</g:if>

</body>
</html>
