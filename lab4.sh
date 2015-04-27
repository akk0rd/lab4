#!/bin/bash 
echo $1
chmod +x lab4
#unpacking archive
tar xfv LE71770282000131SGS00.tar.gz -C ./SRP/lab3
#go to the directory with files
cd ./SRP/lab3
#merge two photo with diferent chanel
gdal_merge.py -o output1.tif -separate LE71770282000131SGS00_B1.TIF LE71770282000131SGS00_B4.TIF
#refactoring photo
gdalwarp -tr 20.000000000000000 -20.000000000000000 -t_srs '+proj=utm +zone=36' LE71770282000131SGS00_B1.TIF output.tif
#marge photo with diferent Path Row
gdalwarp -of GTIFF -ot Uint16 -srcnodata 30.000000000000000 -dstnodata -30.000000000000000 LE71770282000131SGS00_B1.TIF LE71770282000131SGS00_B2.TIF LE71770282000131SGS00_B5.TIF LE71770282000131SGS00_B4.TIF  output2.tif
#cut image for border
##gdalwarp -dstnodata 30.000000000000000 -q -cutline ShapeFile.shp -crop_to_cutline -of GTiff LE71770282000131SGS00_B1.TIF ##output3.tif

