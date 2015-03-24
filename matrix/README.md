# MatrixBug
**UNSOLVED**
[OpenFL Ticket #307](https://github.com/openfl/openfl/issues/307)

It looks like the skew (b and c matrix properties) is not rendered properly.

This example shows 9 images with different matrix affine transformation applied.
// first bitmap (none)
// second bitmap (scaling)
// third bitmap (skewx)
// fourth bitmap (skewy)
// fifth bitmap (rotate)
// sixth bitmap (skewx+rotate)
// seventh bitmap (skewx+rotate+scale)
// eighth bitmap (skewx+rotate+scale+flip+translation)
// ninth bitmap (none)

Legacy Matrix:
````
» lime test neko -Dlegacy
Main.hx:21: OpenFL 2 (legacy)
Main.hx:49: index_0 matrix=(a=1, b=0, c=0, d=1, tx=75, ty=75)
Main.hx:57: index_1 matrix=(a=-1, b=0, c=0, d=-1, tx=225, ty=75)
Main.hx:66: index_2 matrix=(a=1, b=0, c=0.363970234266202, d=1, tx=375, ty=75)
Main.hx:75: index_3 matrix=(a=1, b=0.363970234266202, c=0, d=1, tx=75, ty=225)
Main.hx:84: index_4 matrix=(a=0.939692620785908, b=0.342020143325669, c=-0.342020143325669, d=0.939692620785908, tx=225, ty=225)
Main.hx:94: index_5 matrix=(a=0.898794046299167, b=-0.438371146789077, c=1.11566104058609, d=0.568457693188051, tx=375, ty=225)
Main.hx:105: index_6 matrix=(a=1.078552855559, b=0.526045376146893, c=-1.33879324870331, d=0.682149231825662, tx=75, ty=375)
Main.hx:117: index_7 matrix=(a=-1.078552855559, b=-0.526045376146893, c=1.33879324870331, d=-0.682149231825662, tx=325, ty=475)
Main.hx:126: index_8 matrix=(a=1, b=0, c=0, d=1, tx=75, ty=75)
````

Next Matrix:
````
» lime test neko
Main.hx:23: OpenFL 3 (next)
Main.hx:49: index_0 matrix=matrix(1, 0, 0, 1, 75, 75)
Main.hx:57: index_1 matrix=matrix(-1, 0, 0, -1, 225, 75)
Main.hx:66: index_2 matrix=matrix(1, 0, 0.363970234266202, 1, 375, 75)
Main.hx:75: index_3 matrix=matrix(1, 0.363970234266202, 0, 1, 75, 225)
Main.hx:84: index_4 matrix=matrix(0.939692620785908, 0.342020143325669, -0.342020143325669, 0.939692620785908, 225, 225)
Main.hx:94: index_5 matrix=matrix(0.898794046299167, -0.438371146789077, 1.11566104058609, 0.568457693188051, 375, 225)
Main.hx:105: index_6 matrix=matrix(1.078552855559, 0.526045376146893, -1.33879324870331, 0.682149231825662, 75, 375)
Main.hx:117: index_7 matrix=matrix(-1.078552855559, -0.526045376146893, 1.33879324870331, -0.682149231825662, 325, 475)
Main.hx:126: index_8 matrix=matrix(1, 0, 0, 1, 75, 75)
````

Compared results (output superimposed to show differences)
![comparison](https://dl.dropboxusercontent.com/u/683344/akifox/openfl3-check/matrix.png)

All the skew modifications in OpenFL3 are not rendered as OpenFL2.
