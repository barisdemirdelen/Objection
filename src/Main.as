package {

import flash.display.MovieClip;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

public class Main extends Sprite {
    public function Main() {
        this.stage.align = StageAlign.TOP_LEFT;
        this.stage.scaleMode = StageScaleMode.NO_SCALE;
        var mainSprite:objectionAppSprite = new objectionAppSprite();
        mainSprite.width = this.stage.fullScreenWidth;
        mainSprite.height = this.stage.fullScreenHeight;
        mainSprite.x = 0;
        mainSprite.y = 0;
        this.addChild(mainSprite);


        mainSprite.button1.txtName.text = "Slam!";
        mainSprite.button2.txtName.text = "Objection!";
        mainSprite.button3.txtName.text = "Hold It!";
        mainSprite.button4.txtName.text = "Take That!";
        mainSprite.button5.txtName.text = "Gotcha!";
    }
}
}
