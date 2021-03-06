<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name='layout' content='main'/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${grailsApplication.config.projectID} | Search results</title>
    <parameter name="search" value="selected"></parameter>   
    <script src="${resource(dir: 'js', file: 'jqplot/jquery.min.js')}" type="text/javascript"></script>
    <script src="${resource(dir: 'js', file: 'jqplot/jquery.jqplot.js')}" type="text/javascript"></script>
    <script src="${resource(dir: 'js', file: 'jqplot/plugins/jqplot.canvasTextRenderer.min.js')}" type="text/javascript"></script>
    <script src="${resource(dir: 'js', file: 'jqplot/plugins/jqplot.canvasAxisLabelRenderer.min.js')}" type="text/javascript"></script>
    <script src="${resource(dir: 'js', file: 'jqplot/plugins/jqplot.highlighter.js')}" type="text/javascript"></script>
    <script src="${resource(dir: 'js', file: 'jqplot/plugins/jqplot.cursor.min.js')}" type="text/javascript"></script>
    <script src="${resource(dir: 'js', file: 'jqplot/plugins/jqplot.dateAxisRenderer.min.js')}" type="text/javascript"></script>
    <script src="${resource(dir: 'js', file: 'jqplot/plugins/jqplot.logAxisRenderer.js')}" type="text/javascript"></script>
    <script src="${resource(dir: 'js', file: 'jqplot/plugins/jqplot.bubbleRenderer.min.js')}" type="text/javascript"></script>
    <script src="${resource(dir: 'js', file: 'DataTables-1.9.4/media/js/jquery.dataTables.js')}" type="text/javascript"></script>
    <script src="${resource(dir: 'js', file: 'TableTools-2.0.2/media/js/TableTools.js')}" type="text/javascript"></script>
    <script src="${resource(dir: 'js', file: 'TableTools-2.0.2/media/js/ZeroClipboard.js')}" type="text/javascript"></script>
    
    <link rel="stylesheet" href="${resource(dir: 'js', file: 'jqplot/jquery.jqplot.css')}" type="text/css"></link>
    <link rel="stylesheet" href="${resource(dir: 'js', file: 'DataTables-1.9.4/media/css/data_table.css')}" type="text/css"></link>
    <link rel="stylesheet" href="${resource(dir: 'js', file: 'TableTools-2.0.2/media/css/TableTools.css')}" type="text/css"></link>

    <script type="text/javascript">
         /* scientific sorting functions for evalues */
        jQuery.fn.dataTableExt.oSort['scientific-asc']  = function(a,b) {
        	var x = parseFloat(a);
        	var y = parseFloat(b);
        	return ((x < y) ? -1 : ((x > y) ?  1 : 0));
        };
 
        jQuery.fn.dataTableExt.oSort['scientific-desc']  = function(a,b) {
        	var x = parseFloat(a);
        	var y = parseFloat(b);
        	return ((x < y) ? 1 : ((x > y) ?  -1 : 0));
        };
    </script> 
    <script>
    function get_table_data(type){
    	var table_scrape = [];
	    var oTable = document.getElementById('gene_table');
	    //gets table
	    var rowLength = oTable.rows.length;
	    //gets rows of table
	    for (i = 0; i < rowLength; i++){
		   //loops through rows
	       var oCells = oTable.rows.item(i).cells;
	       var cellVal = oCells.item(1).innerHTML;
	       var matcher = cellVal.match(/.*?mid=(.*?)">.*/);
	       if (matcher){
	       		//alert('match = '+matcher[1])
	       	   table_scrape.push(matcher[1])
	       }
	    }
	    if (type == 'pep'){
		    document.getElementById('pepFileId').value=table_scrape;
		}else{
			document.getElementById('nucFileId').value=table_scrape;
		}
	    //alert(table_scrape)
    }
    </script>
    <script>

    <% 
    def jsonAnno = annoLinks.encodeAsJSON();  
    def pubjsonData = pubRes.encodeAsJSON(); 
    %>
    $(document).ready(function() {
         
         $('#gene_table').dataTable({
    	    "sPaginationType": "full_numbers",
    	    "iDisplayLength": 10,
    	    "aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
    	    "oLanguage": {
    	     	     "sSearch": "Filter records:"
    	     },
    	    "aaSorting": [[ 7, "asc" ]],
    	    "aoColumns": [
					 null,
					 null,
					 null,
					 null,
					 null,
					 null,
					 null,
					 { "sType": "scientific" },
					 null,
				],
    	    "sDom": 'T<"clear">lfrtip',
            "oTableTools": {
        	"sSwfPath": "${resource(dir: 'js', file: 'TableTools-2.0.2/media/swf/copy_cvs_xls_pdf.swf')}"
            }
         });
         
         var anOpen = [];
		var sImageUrl = "${resource(dir: 'js', file: 'DataTables-1.9.4/examples/examples_support/')}";
		 
		var oTable = $('#pub_table').dataTable( {
			"bProcessing": true,
			"aaData": ${pubjsonData},
			"aoColumns": [
				{
				   "mDataProp": null,
				   "sClass": "control center",
				   "sDefaultContent": '<img src="'+sImageUrl+'details_open.png'+'">'
				},
				{ "mDataProp": "title",
				"fnRender": function ( oObj, sVal ){
					return "<a href=\"http://www.ncbi.nlm.nih.gov/pubmed?term="+oObj.aData["pubmed_id"]+ "\"target='_blank'>"+sVal+"</a>";
				}},
				{ "mDataProp": "authors" },
				{ "mDataProp": "journal_short" },
				{ "mDataProp": "date_out"},
				{ "mDataProp": "rank",
				"fnRender": function ( oObj, sVal ){
					return sVal.toFixed(3);
				}},
			],
			"sPaginationType": "full_numbers",
				"iDisplayLength": 10,
				"aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]],
				"oLanguage": {
						 "sSearch": "Filter records:"
				 },
				"aaSorting": [[ 5, "desc" ]],
				"sDom": 'T<"clear">lfrtip',
				"oTableTools": {
				"sSwfPath": "${resource(dir: 'js', file: 'TableTools-2.0.2/media/swf/copy_cvs_xls_pdf.swf')}"
				}
		} );
		
		$('#pub_table td.control').live( 'click', function () {
		  var nTr = this.parentNode;
		  var i = $.inArray( nTr, anOpen );
		   
		  if ( i === -1 ) {
			$('img', this).attr( 'src', sImageUrl+"details_close.png" );
			var nDetailsRow = oTable.fnOpen( nTr, fnFormatDetails(oTable, nTr), 'details' );
			$('div.innerDetails', nDetailsRow).slideDown();
			anOpen.push( nTr );
		  }
		  else {
			$('img', this).attr( 'src', sImageUrl+"details_open.png" );
			$('div.innerDetails', $(nTr).next()[0]).slideUp( function () {
			  oTable.fnClose( nTr );
			  anOpen.splice( i, 1 );
			} );
		  }
		} );
		 
		function fnFormatDetails( oTable, nTr )
		{
		  var oData = oTable.fnGetData( nTr );
		  var sOut =
			'<div class="innerDetails">'+
			  '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:10px;">'+
				'<tr><td><b>Abstract:</b><br><p align="justify">'+oData.abstract_text+'</p></td></tr>'+
			  '</table>'+
			'</div>';
		   //alert(sOut)
		  return sOut;
		}
    });
    </script>
  </head>
  <body>
  <div class="introjs-search-all_searched">
  <!-- check for errors -->
  <g:if test="${error == "empty"}">
    <h1>Please enter a search term</h1>
    <g:link action=''>Search Again</g:link>
  </g:if>
  <g:if test="${error == "too_short"}">
    <h1>Your search term is too short, it needs to be at least two characters, please <g:link action=''>search Again</g:link></h1>
  </g:if>
  <g:if test="${error == "no_anno"}">
    <h1>Please select some annotations</h1>
    <g:link action=''>Search Again</g:link>
  </g:if>
  
  <g:if test="${params.gffId}">
  	 <g:link action="">Search</g:link> > <g:link action="species">Species</g:link> > <g:link action="species_v" params="${[Sid:genomeData.genome.meta.id]}"><i> ${genomeData.genome.meta.genus[0]}. ${genomeData.genome.meta.species}</i></g:link> > Genome: <g:link action="species_search" params="${[Gid:genomeData.id,GFFid:params.gffId]}">v${genomeData.file_version}</g:link> > Search results
  </g:if>
  <g:else>
 	 <g:link action="">Search</g:link> > <g:link action="all_search">Search all</g:link> > Search results 
  </g:else>
  <div class="inline">
  <br><h1>Results for search of '<em>${searchId}</em>' across all data</h1> 
  </div><br>
  <g:if test="${geneRes}">
	<table class="table_border" width='100%'>
		<tr><td>
			Searched all records in ${search_time}.<br>
			</td><td data-intro='Download the sequence data for the transcripts and proteins in the table<br><br>To download all the search results, change the number in the <b>Show entries</b> box' data-step='4'><center>
			Download genes in table:
			<!-- download genes form gets fileName value from get_table_data() -->
			<div class="inline">
				<g:form name="nucfileDownload" url="[controller:'FileDownload', action:'gene_download']">
				<g:hiddenField name="nucFileId" value=""/>
				<g:hiddenField name="fileName" value="${searchId}"/>
				<g:hiddenField name="seq" value="Nucleotides"/>
				<a href="#" onclick="get_table_data('nuc');document.nucfileDownload.submit()">Nucleotides</a>
			</g:form> 
			|
			<g:form name="pepfileDownload" url="[controller:'FileDownload', action:'gene_download']">
				<g:hiddenField name="pepFileId" value=""/>
				<g:hiddenField name="fileName" value="${searchId}"/>
				<g:hiddenField name="seq" value="Peptides"/>
				<a href="#" onclick="get_table_data('pep');document.pepfileDownload.submit()">Peptides</a>
			</g:form>
			</div>
			</center>
		</td></tr>
	</table>
  </g:if>
  <g:if test="${geneRes}">
  <br>
    <h2 data-position='top' data-intro='Search results from matches to the gene annotation data' data-step='1'>${geneRes.size()} matches from the gene data:</h2> 
        <table id="gene_table" class="display">
            <thead>
              <tr>
              	<g:if test="${params.gffId}">
              		<th></th>
                </g:if>
                <g:else>
                	<th><b>Species</b></th>
                </g:else>
                <th data-position='top' data-intro='Click on a transcript ID to see details of the transcript' data-step='2'><b>Transcript ID</b></th>
                <th><b>Database</b></th>
                <th data-position='top' data-intro='Click on a hit ID to see details of the annotation match' data-step='3'><b>Hit ID</b></th>
                <th width="40%"><b>Description</b></th>
                <th><b>Start</b></th>
                <th><b>Stop</b></th>
                <th><b>Score</b></th>
                <th><b>Rank</b></th>
              </tr>
             </thead>
             <tbody>
               <g:each var="res" in="${geneRes}">
                <tr>  
                  <g:if test="${!params.gffId}">
                  	<td><g:link action="species_v" params="${[Sid: res.gid]}"><i>${res.genus[0]}. ${res.species}</i></g:link></td>
                  </g:if>
                  <g:else>
                  	<td></td>
                  </g:else>
                  <td><g:link action="m_info" params="${[mid: res.mrna_id]}"> ${res.mrna_id}</g:link></td>
                  <!-- <a href="m_info?Gid=${params.Gid}&mid=${res.mrna_id}">${res.mrna_id}</a>-->
                  <td>${res.anno_db}</td>
                   <%
					//set links
					annoLinks.each{
						if (res.anno_db == it.key){
							res.anno_id = res.anno_id.replaceAll(it.value[0], "<a href=\""+it.value[1]+"\$1\" target=\'_blank\'>\$1</a>") 
						}
					}
				  //interpro	
				  res.anno_id = res.anno_id.replaceAll(/(IPR\d+)/, "<a href=\"http://www.ebi.ac.uk/interpro/entry/\$1\" target=\'_blank\'>\$1</a>")
				   %>
                  <td>${res.anno_id}</td>
                  <%if (res.descr.size()>200){ res.descr = res.descr[0..200]+" ... "};%>
                  <td>${res.descr}</td>
                  <td>${res.anno_start}</td>
                  <td>${res.anno_stop}</td>
                  <td>${res.score}</td>
                  <td>${sprintf("%.3f",res.rank)}</td>
                </tr>                  
               </g:each>
              </tbody>
         </table> 
         <br>
  </g:if>
  <g:else>
  		<br><h2>0 matches from the gene data.</h2>
  </g:else>
    <g:if test="${sp == false}">
		<g:if test="${pubRes}">
		<hr size = 5 color="green" width="100%" style="margin-top:10px">  
		<h2 data-position='top' data-intro='Search results from matches to the publication abstracts' data-step='5'>${pubRes.size()} matches from the publication data:</h2> 
			<table cellpadding="0" cellspacing="0" border="0" class="display" id="pub_table">
				<thead>
					<tr>
						<th></th>
						<th width="40%">Title</th>
						<th>Authors</th>
						<th>Journal</th>
						<th>Date</th>
						<th><b>Rank</b></th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</g:if>
		<g:else>
		 <hr size = 5 color="green" width="100%" style="margin-top:10px">
		 <br><h2>0 matches from the publication data.</h2>
		</g:else>
	</g:if>
</div>
</body>
</html>


