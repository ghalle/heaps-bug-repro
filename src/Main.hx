import h2d.col.Point;
import h2d.Interactive;
import h2d.Bitmap;

class Main extends hxd.App {
	override function init() {
		var tile = h2d.Tile.fromColor(0x56A020, 200, 60);
		var rectangle = new Bitmap(tile, s2d);
		rectangle.setPosition(300, 300);
		rectangle.rotation = 90 * (Math.PI / 180);

		var i = new Interactive(tile.width, tile.height, rectangle);
		i.onPush = function (e) {
			var x = e.relX;
			var y = e.relY;

			i.startDrag(function (e) {
				var dx = e.relX - x;
				var dy = e.relY - y;
				trace('$dx, $dy');
			});
		};
		i.onRelease = function (e) {
			i.stopDrag();
		};
	}

	static function main() {
		new Main();
	}
}
