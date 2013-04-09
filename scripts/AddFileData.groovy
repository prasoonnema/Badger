package badger

import groovy.sql.Sql

def grailsApplication
def dataSource = ctx.getBean("dataSource")
def sql = new Sql(dataSource)


//////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////Edit the section below ////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

// This just allows each data set to be turned on and off simply by commenting out the function call
//M_meles()
L_rub()

/////// L. rubellus
def L_rub(){
	def metaMap = [:]
	def genomeMap = [:]
	def fileMap = [:]	
	def annoMap = [:]
	
// --- Species Data ---	
	metaMap.genus = "Lumbricus";
	metaMap.species = "rubellus";
	metaMap.description = "Lumbricus rubellus is a common earthworm, found in many temperate ecosystems, used as a model species by researchers investigating the biology and ecology of the soil, and the effects of pollutants and other chemicals on soil organisms."
	metaMap.image_file = "lumbricus_rubellus.jpg"
	metaMap.image_source = "http://www.naturewatch.ca/english/wormwatch/about/key/about_key_lrub.html"
	addMeta(metaMap)
	
// --- Genome Data ---	
	genomeMap.gbrowse = "http://salmo.bio.ed.ac.uk/fgb2/gbrowse/genome_0_4/"
	genomeMap.dateString = Date.parse("dd/MM/yyyy","10/11/2011")
	genomeMap.gversion = "0.4"
	addGenome(genomeMap)
	
// --- File Data --- 	
	// globals (blast,search,download and cov need to be added to each file type if the values differ)
	// blast, search and download can be either public (pub) or private (priv)
	// coverage can be either yes (y) or no (n)
	// file_link is only required for the mRNA and peptide files and needs to match the name of the GFF3 from which they originated
	fileMap.file_dir = "L_rubellus"
	fileMap.loaded = false
	fileMap.blast = "pub"
	fileMap.search = "pub"
	fileMap.download = "pub"
	fileMap.cov = "n"
	fileMap.file_link = "n"
	
	//genome
	fileMap.file_type = "Genome"
	fileMap.file_name = "L_rubellus_genome_0.4.fa"
	fileMap.file_version = "0.4"
	fileMap.description = "Mixed and merged assembly of Illumina and 454 data."
	addFile(fileMap)
	
	//gff
	fileMap.file_type = "Genes"
	fileMap.file_name = "L_rubellus_0.4.gff"
	fileMap.file_version = "0.4"
	fileMap.description = "Merged gene set using MAKER, Exonerate protein2genome, Augustus and manual gene predictions"
	addFile(fileMap)
	
	//mRNA
	fileMap.file_type = "mRNA"
	fileMap.file_name = "L_rubellus_transcripts_0.4.fa"
	fileMap.file_version = "0.4"
	fileMap.description = "Merged gene set using MAKER, Exonerate protein2genome, Augustus and manual gene predictions"
	fileMap.file_link = "L_rubellus_0.4.gff"
	addFile(fileMap)
	
	//Peptide
	fileMap.file_type = "Peptide"
	fileMap.file_name = "L_rubellus_proteins_0.4.fa"
	fileMap.file_version = "0.4"
	fileMap.description = "Merged gene set using MAKER, Exonerate protein2genome, Augustus and manual gene predictions"
	fileMap.file_link = "L_rubellus_0.4.gff"
	addFile(fileMap)
}

/////// M. meles
def M_meles(){
	def metaMap = [:]
	def genomeMap = [:]
	def fileMap = [:]	
	def annoMap = [:]
	
// --- Species Data ---	
	metaMap.genus = "Meles";
	metaMap.species = "meles";
	metaMap.description = "The European badger (Meles meles) is a species of badger of the genus Meles, native to almost all of Europe. It is classed as Least Concern for extinction by the IUCN, due to its wide distribution and large population. The European badger is a social, burrowing animal which lives on a wide variety of plant and animal foods. It is very fussy over the cleanliness of its burrow, and defecates in latrines. Cases are known of European badgers burying their dead family members. Although ferocious when provoked, a trait which was once exploited for the blood sport of badger-baiting, the European badger is generally a peaceful animal, having been known to share its burrows with other species such as rabbits, red foxes and raccoon dogs. Although it does not usually prey on domestic stock, the species is nonetheless alleged to damage livestock through spreading bovine tuberculosis."
	metaMap.image_file = "BadgerSilhouette.jpg"
	metaMap.image_source = "FreeVectors.net"
	addMeta(metaMap)
	
// --- Genome Data ---	
	genomeMap.gbrowse = "http://salmo.bio.ed.ac.uk/cgi-bin/gbrowse/gbrowse/nHd.2.3.1"
	genomeMap.dateString = Date.parse("dd/MM/yyyy","17/01/2012")
	genomeMap.gversion = "M meles 1.0"
	addGenome(genomeMap)
	
// --- File Data --- 	
	// globals (blast,search,download and cov need to be added to each file type if the values differ)
	// blast, search and download can be either public (pub) or private (priv)
	// coverage can be either yes (y) or no (n)
	// file_link is only required for the mRNA and peptide files and needs to match the name of the GFF3 from which they originated
	fileMap.file_dir = "M_meles"
	fileMap.loaded = false
	fileMap.blast = "pub"
	fileMap.search = "pub"
	fileMap.download = "pub"
	fileMap.cov = "n"
	fileMap.file_link = "n"
	
	//genome
	fileMap.file_type = "Genome"
	fileMap.file_name = "M_meles.genome.100.fa"
	fileMap.file_version = "1.0"
	fileMap.description = "The genome of M. meles has not yet been sequenced, this is just an example data set."
	addFile(fileMap)
	
	//gff
	fileMap.file_type = "Genes"
	fileMap.file_name = "M_meles_1.100.gff"
	fileMap.file_version = "1.1"
	fileMap.description = "A GFF3 file generated by some gene prediction software"
	addFile(fileMap)
	
	//mRNA
	fileMap.file_type = "mRNA"
	fileMap.file_name = "M_meles_1.transcripts.100.fa"
	fileMap.file_version = "1.1"
	fileMap.description = "A set of transcripts based on the predicted genes"
	fileMap.file_link = "M_meles_1.100.gff"
	addFile(fileMap)
	
	//Peptide
	fileMap.file_type = "Peptide"
	fileMap.file_name = "M_meles_1.proteins.100.fa"
	fileMap.file_version = "1.1"
	fileMap.description = "A set of proteins based on the predicted genes"
	fileMap.file_link = "M_meles_1.100.gff"
	addFile(fileMap)

// --- Annotation data ---	
	// the addAnno function requires two values, the first is the name of the GFF3 file to which the annotations should be assigned
	// the second should remain unchanged
	
	//blast data
	annoMap.type = "blast"				
	annoMap.link = "http://www.ncbi.nlm.nih.gov/protein/"
	annoMap.source = "SwissProt"
	annoMap.regex = "gi\\|(\\d+)\\|.*"
	annoMap.anno_file = "M_meles_1.blast1.100.xml"
	annoMap.loaded = false	
	addAnno("M_meles_1.100.gff",annoMap)
	
	annoMap.link = "http://www.ncbi.nlm.nih.gov/nucest/"
    annoMap.source = "Tardigrade ESTs"
	annoMap.regex = "gi\\|(\\d+)\\|.*"
	annoMap.anno_file = "M_meles_1.blast2.100.xml"
    annoMap.loaded = false
    addAnno("M_meles_1.100.gff",annoMap)
	
	//functional data
	annoMap.type = "fun"				
	annoMap.link = "http://enzyme.expasy.org/EC/"
	annoMap.source = "Annot8r EC"
	annoMap.regex = "(.*)"
	annoMap.anno_file = "M_meles_1.ec.100.txt"
	annoMap.loaded = false	
	addAnno("M_meles_1.100.gff",annoMap)
	
	annoMap.link = "http://www.ebi.ac.uk/QuickGO/GTerm?id="
	annoMap.source = "Annot8r GO"
	annoMap.regex = "(.*)"
	annoMap.anno_file = "M_meles_1.go.100.txt"
	annoMap.loaded = false	
	addAnno("M_meles_1.100.gff",annoMap)
	
	annoMap.link = "http://www.genome.jp/dbget-bin/www_bget?ko:"
	annoMap.source = "Annot8r KEGG"
	annoMap.regex = "(.*)"
	annoMap.anno_file = "M_meles_1.kegg.100.txt"
	annoMap.loaded = false	
	addAnno("M_meles_1.100.gff",annoMap)
	
	//interproscan data
	annoMap.type = "ipr"
	annoMap.link = "http://www.ebi.ac.uk/interpro/IEntry?ac="
	annoMap.source = "InterProScan"
	annoMap.regex = "(IPR\\d+).*?"
	annoMap.anno_file = "M_meles_1.ipr.100.txt"
	annoMap.loaded = false	
	addAnno("M_meles_1.100.gff",annoMap)
	
	//Second set of gene predictions
	
	// --- Species Data ---	
	// only need genus and species to match previous record
	metaMap.genus = "Meles";
	metaMap.species = "meles";
	addMeta(metaMap)
	
	// --- Genome Data ---	
	//only need genome id to match previous record 
	genomeMap.gversion = "M meles 1.0"
	addGenome(genomeMap)
	
	//gff
	fileMap.file_type = "Genes"
	fileMap.file_name = "M_meles_2.100.gff"
	fileMap.file_version = "1.2"
	fileMap.description = "Another GFF3 file generated by some gene prediction software"
	addFile(fileMap)
	
	//mRNA
	fileMap.file_type = "mRNA"
	fileMap.file_name = "M_meles_2.transcripts.100.fa"
	fileMap.file_version = "1.2"
	fileMap.description = "A set of transcripts based on the predicted genes"
	fileMap.file_link = "M_meles_2.100.gff"
	addFile(fileMap)
	
	//Peptide
	fileMap.file_type = "Peptide"
	fileMap.file_name = "M_meles_2.proteins.100.fa"
	fileMap.file_version = "1.2"
	fileMap.description = "A set of transcripts based on the predicted genes"
	fileMap.file_link = "M_meles_2.100.gff"
	addFile(fileMap)

// // --- Annotation files and data ---
	annoMap = [:]
	//blast
	annoMap.type = "blast"
	annoMap.link = "http://www.ncbi.nlm.nih.gov/protein/"
	annoMap.source = "SwissProt"
	annoMap.regex = "gi\\|(\\d+)\\|.*"
	annoMap.anno_file = "M_meles_2.blast1.100.xml"
	annoMap.loaded = false
	addAnno("M_meles_2.100.gff",annoMap)
	
	annoMap.link = "http://www.ncbi.nlm.nih.gov/nucest/"
	annoMap.source = "Tardigrade ESTs"
	annoMap.regex = "gi\\|(\\d+)\\|.*"
	annoMap.anno_file = "M_meles_2.blast2.100.xml"
	annoMap.loaded = false
	addAnno("M_meles_2.100.gff",annoMap)

	//functional
	annoMap.type = "fun"
	annoMap.link = "http://enzyme.expasy.org/EC/"
	annoMap.source = "Annot8r EC"
	annoMap.regex = "(.*)"
	annoMap.anno_file = "M_meles_2.ec.100.txt"
	annoMap.loaded = false
	addAnno("M_meles_2.100.gff",annoMap)
	
	annoMap.link = "http://www.ebi.ac.uk/QuickGO/GTerm?id="
	annoMap.source = "Annot8r GO"
	annoMap.regex = "(.*)"
	annoMap.anno_file = "M_meles_2.go.100.txt"
	annoMap.loaded = false
	addAnno("M_meles_2.100.gff",annoMap)
	
	annoMap.link = "http://www.genome.jp/dbget-bin/www_bget?ko:"
	annoMap.source = "Annot8r KEGG"
	annoMap.regex = "(.*)"
	annoMap.anno_file = "M_meles_2.kegg.100.txt"
	annoMap.loaded = false
	addAnno("M_meles_2.100.gff",annoMap)
	
	//interproscan
	annoMap.type = "ipr"
	annoMap.link = "http://www.ebi.ac.uk/interpro/IEntry?ac="
	annoMap.source = "InterProScan"                              
	annoMap.regex = "(IPR\\d+).*?"
	annoMap.anno_file = "M_meles_2.ipr.100.txt"
	annoMap.loaded = false
	addAnno("M_meles_2.100.gff",annoMap)
	
}

// To add another species start a new function, e.g.
//def new_species(){
//	...
//}

// To add another genome add another 'Genome Data' section inside the same species function

// To add another set of genes add another set of gff, mRNA and peptides options from the 'File Data' section inside the same species function

// To add more annotation data add another 'Annotation Data' section inside the same species function


//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////// Do not edit below this line /////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

//MetaData 
def genus,species,gversion,description,gbrowse,image_file,image_source
//FileData
def blast,cov,download,file_dir,file_link,file_name,file_type,file_version,loaded,search

MetaData meta
def addMeta(metaMap){
	def check = MetaData.findByGenusAndSpecies(metaMap.genus, metaMap.species)
	if (check){
		println metaMap.genus+" "+metaMap.species+" already exists - "+check
		meta = check
	}else{  		
		meta = new MetaData(metaMap)
		meta.save(flush:true)
	}
}

//set the new genome to global to be picked up by addFile
GenomeData new_genome
def addGenome(genomeMap){
	def check = GenomeData.findByGversion(genomeMap.gversion)
	if (check){
		println "genome version "+genomeMap.gversion+" already exists - "+check
		new_genome = check
	}else{
		println genomeMap
		new_genome = new GenomeData(genomeMap) 
		meta.addToGenome(new_genome)
		new_genome.save(flush:true)
		println "New genome for "+new_genome.meta.genus+" "+new_genome.meta.species+" date "+genomeMap.dateString+" was added"
	}
}

def addFile(fileMap){
	def check = FileData.findByFile_nameAndFile_type(fileMap.file_name, fileMap.file_type)
	if (check){
		println "file name "+fileMap.file_name+" type "+fileMap.file_type+" already exists - "+check
	}
	else if (new File("data/"+fileMap.file_dir+"/"+fileMap.file_name).exists()){
		println "Adding "+fileMap
		FileData file = new FileData(fileMap) 
		new_genome.addToFiles(file)
		file.save(flush:true)
		println fileMap.file_name+" was added"
	}else{
		println "file data/"+fileMap.file_dir+"/"+fileMap.file_name+" does not exist!"
	}
}
def addAnno(fileName,annoMap){
	FileData file = FileData.findByFile_name(fileName)
	//println "file = "+file
	def filedir = FileData.findByFile_name(fileName).file_dir
	//println "filedir = "+filedir
	def check = []
	if (FileData.findByFile_name(fileName).anno){
		//println "anno = "+FileData.findByFile_name(fileName).anno
		check = FileData.findByFile_name(fileName).anno.anno_file			
	}
	//println "check = "+check
	if (annoMap.anno_file in check){
		println annoMap.anno_file+" already exists for "+fileName+" so not adding"
	}else{
		if (new File("data/"+filedir+"/"+annoMap.anno_file).exists()){				
			println annoMap
			AnnoData anno = new AnnoData(annoMap)
			file.addToAnno(anno)
			anno.save(flush:true)
			println annoMap.anno_file+" was added"
		}else{
			println "data/"+filedir+"/"+annoMap.anno_file+" doesn't exist"
		}
	}
}
