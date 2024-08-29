#@File file              // <-- If you want to open the input image from file instead
open(file);              //     of using the active ImageJ image, remove the leading slashes in
title = getTitle();      //     front of these three lines, and in front of the very last line of this macro


function makeAnimation() {
	return "" +
"	// Record contrast\n" +
"	At frame 0:\n" +
"	- change channel 1 intensity to (0.0, 200.0, 1.0)\n" +
"	- change channel 1 alpha to (0.0, 200.0, 0.10000000149011612)\n" +
"	- change channel 1 color to (255.0, 255.0, 255.0)\n" +
"	- change channel 1 lookup table to image lookup table\n" +
"	- change channel 1 light to (0.800000011920929, 0.30000001192092896, 0.0, 5.0)\n" +
"	- change channel 1 lighting to on\n" +
"	- change channel 1 weight to 1.2\n" +
"	- change rendering algorithm to independent transparency\n" +
"	- change background color to (0.0, 0.0, 0.0)\n" +
"	- change scalebar length to 5\n";
}
path = getDirectory("temp") + "xyz.animation.txt";
File.saveString(makeAnimation(), path);

run("Maximum 3D...", "x=2 y=2 z=1");
run("mpl-plasma");

run("Batch Animation",
	"animation=" + path + " " +
	"output_width=400 output_height=400");


close(title);       // <-- If you want to open the input image from file instead
                      //     of using the active ImageJ image, remove the leading slashes in
                      //     front of 'close(title)' to close the input image after running the macro
