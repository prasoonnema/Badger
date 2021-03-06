<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name='layout' content='main'/>
  <title>${grailsApplication.config.projectID} admin</title>
  <parameter name="admin" value="selected"></parameter>
  </head>

  <body>
<div class="bread"><g:link action="home">Admin</g:link> > <g:link action="home">Home</g:link> > <g:link action="editSpecies" params="${[Gid:annoData.filedata.genome.meta.id]}"><i>${annoData.filedata.genome.meta.genus} ${annoData.filedata.genome.meta.species}</i></g:link> > <g:link action="editGenome" params="${[gid:annoData.filedata.genome.id]}">Edit genome</g:link> > Edit annotation</div>
   
<h1>Edit annotation file data:</h1>

<g:form action="editedAnno" controller="admin">

<g:if test = "${annoData.type == 'blast'}">  
	<h2><b>BLAST file (xml blast output)</b></h2>
	<p>Database<font color="red">*</font></p>
	<g:textArea value="${annoData.source}" name="b_source" style="width: 98%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/><br>
	<p>File name<font color="red">*</font></p>
	<g:textArea value="${annoData.anno_file}" name="b_anno_file" style="width: 98%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/><br>
	<p>Link<font color="red">*</font></p>
	<g:textArea value="${annoData.link}" name="b_link" style="width: 98%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/><br>
	<p>Regex<font color="red">*</font></p>
	<g:textArea value="${annoData.regex}" name="b_regex" style="width: 98%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/><br>	
</g:if>
<g:if test = "${annoData.type == 'fun'}"> 	
	<h2><b>Functional annotation file (tab delimited file)</b></h2>
	<p>Database<font color="red">*</font></p>
	<g:textArea value="${annoData.source}"name="f_source" style="width: 98%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/><br>
	<p>File name<font color="red">*</font></p>
	<g:textArea value="${annoData.anno_file}" name="f_anno_file" style="width: 98%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/><br>
	<p>Link<font color="red">*</font></p>
	<g:textArea value="${annoData.link}" name="f_link" style="width: 98%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/><br>
	<p>Regex<font color="red">*</font></p>
	<g:textArea value="${annoData.regex}" name="f_regex" style="width: 98%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/><br>	
</g:if>
<g:if test = "${annoData.type == 'ipr'}"> 		
	<h2><b>InterProScan (RAW/TSV format)</b></h2>
	<select id="iprSelect" name="iprSelect">
		<option value="ipr_raw">Raw</option>
		<option value="ipr_xml">XML</option>
	</select>
	<p>File name<font color="red">*</font></p>
	<g:textArea value="${annoData.anno_file}" name="i_anno_file" style="width: 98%; height: 18px; border: 3px solid #cccccc; padding: 2px;"/><br>
	
</g:if>
<input type = "hidden" name="id" value="${annoData.id}">
<br><input class="mybuttons" type="button" value="Update annotation file data" onclick="submit()" >
</g:form>
</body>
</html>
