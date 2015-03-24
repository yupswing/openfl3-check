package ;
import openfl.Lib;
import openfl.display.Bitmap;
import openfl.geom.Matrix;
import openfl.Assets;
import motion.Actuate;

class Main {
    /** Constant factor to pass from degrees to radians **/
    public static var DEG2RAD:Float = Math.PI/180;
    /** Constant factor to pass from radians to degrees **/
    public static var RAD2DEG:Float = 180/Math.PI;

    private static inline var SIZE = 100;
    private static inline var SPAN = 50;
    private static inline var SPAN_BASE = SPAN/2;

    function new() {

        #if (v2 || legacy)
            trace('OpenFL 2 (legacy)');
        #else
            trace('OpenFL 3 (next)');
        #end

        var image_test = new Array<Bitmap>();
        var image_temp:Bitmap;
        var matrix_temp:Matrix;

        for (i in 0...3) {
            for (j in 0...3) {
                image_temp = new Bitmap(Assets.getBitmapData("assets/test.png"),true);
                image_temp.x = SIZE*j+SPAN*(j+1)+SPAN_BASE;
                image_temp.y = SIZE*i+SPAN*(i+1)+SPAN_BASE;
                image_test.push(image_temp);
            }
        }

        for (el in image_test) {
            Lib.current.stage.addChild(el);
        }

        // first bitmap (none)
        matrix_temp = new Matrix();
        image_temp = image_test[0];
        matrix_temp.tx = image_temp.transform.matrix.tx;
        matrix_temp.ty = image_temp.transform.matrix.ty;
        image_temp.transform.matrix = matrix_temp;
        trace('index_0 matrix='+matrix_temp);

        // second bitmap (scaling)
        matrix_temp = new Matrix();
        image_temp = image_test[1];
        matrix_temp.scale(-1,-1);
        matrix_temp.tx = image_temp.transform.matrix.tx;
        matrix_temp.ty = image_temp.transform.matrix.ty;
        trace('index_1 matrix='+matrix_temp);
        image_temp.transform.matrix = matrix_temp;

        // third bitmap (skewx)
        matrix_temp = new Matrix();
        image_temp = image_test[2];
        matrix_temp.c = Math.tan(20*DEG2RAD);
        matrix_temp.tx = image_temp.transform.matrix.tx;
        matrix_temp.ty = image_temp.transform.matrix.ty;
        trace('index_2 matrix='+matrix_temp);
        image_temp.transform.matrix = matrix_temp;

        // fourth bitmap (skewy)
        matrix_temp = new Matrix();
        image_temp = image_test[3];
        matrix_temp.b = Math.tan(20*DEG2RAD);
        matrix_temp.tx = image_temp.transform.matrix.tx;
        matrix_temp.ty = image_temp.transform.matrix.ty;
        trace('index_3 matrix='+matrix_temp);
        image_temp.transform.matrix = matrix_temp;

        // fifth bitmap (rotate)
        matrix_temp = new Matrix();
        image_temp = image_test[4];
        matrix_temp.rotate(20*DEG2RAD);
        matrix_temp.tx = image_temp.transform.matrix.tx;
        matrix_temp.ty = image_temp.transform.matrix.ty;
        trace('index_4 matrix='+matrix_temp);
        image_temp.transform.matrix = matrix_temp;

        // sixth bitmap (skewx+rotate)
        matrix_temp = new Matrix();
        image_temp = image_test[5];
        matrix_temp.c = Math.tan(37*DEG2RAD);
        matrix_temp.rotate(-26*DEG2RAD);
        matrix_temp.tx = image_temp.transform.matrix.tx;
        matrix_temp.ty = image_temp.transform.matrix.ty;
        trace('index_5 matrix='+matrix_temp);
        image_temp.transform.matrix = matrix_temp;

        // seventh bitmap (skewx+rotate+scale)
        matrix_temp = new Matrix();
        image_temp = image_test[6];
        matrix_temp.c = Math.tan(-37*DEG2RAD);
        matrix_temp.rotate(26*DEG2RAD);
        matrix_temp.scale(1.2,1.2);
        matrix_temp.tx = image_temp.transform.matrix.tx;
        matrix_temp.ty = image_temp.transform.matrix.ty;
        trace('index_6 matrix='+matrix_temp);
        image_temp.transform.matrix = matrix_temp;

        // eighth bitmap (skewx+rotate+scale+flip+translation)
        matrix_temp = new Matrix();
        image_temp = image_test[7];
        matrix_temp.c = Math.tan(-37*DEG2RAD);
        matrix_temp.rotate(26*DEG2RAD);
        matrix_temp.scale(1.2,1.2);
        matrix_temp.scale(-1,-1);
        matrix_temp.tx = image_temp.transform.matrix.tx+SIZE;
        matrix_temp.ty = image_temp.transform.matrix.ty+SIZE;
        trace('index_7 matrix='+matrix_temp);
        image_temp.transform.matrix = matrix_temp;

        // nineth bitmap (none)
        matrix_temp = new Matrix();
        image_temp = image_test[0];
        matrix_temp.tx = image_temp.transform.matrix.tx;
        matrix_temp.ty = image_temp.transform.matrix.ty;
        image_temp.transform.matrix = matrix_temp;
        trace('index_8 matrix='+matrix_temp);
    }

}
