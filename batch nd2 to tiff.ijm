/* Open all nd2 files in a dir, convert to tif, and save to outdir
 You will be prompted twice to select a directory. First one is the dir
 containing the nd2 files to be converted. Second is where you want them to
 be saved. 
 This does not delete the original nd2 files.
*/

// This path is where the getDirectory dialogue will open to
dir = getDirectory("M:\\Nick Chahley\\NIS\\CTC Team Images\\Clinical Samples\\2019 - CHUM EOC\\201018 - CHUM 10646\\analysis\\15 tiff");
outdir = getDirectory(dir)

filelist = getFileList(dir);
for (i=0; i< filelist.length; i++) {
	// only process nd2
	if (endsWith(filelist[i], ".nd2")) {
		run("Bio-Formats Importer", "open='" + dir + filelist[i] + "' color_mode=Default view=Hyperstack stack_order=XYCZT");
		saveAs("Tiff", outdir + filelist[i] + ".tif");
		close();
	}
}
