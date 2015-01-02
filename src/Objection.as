package {

import fl.video.VideoEvent;

import flash.desktop.NativeApplication;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.filesystem.File;

public class Objection extends Sprite {


    private var currentVideo:slam = null;
    private var mainSprite:objectionAppSprite = null;

    private var video1Sprite:slam = null;
    private var video2Sprite:slam = null;
    private var video3Sprite:slam = null;
    private var video4Sprite:slam = null;
    private var video5Sprite:slam = null;

    public function Objection() {
        if (this.stage) {
            init();
        } else {
            this.addEventListener(Event.ADDED_TO_STAGE, init);
        }
    }

    private function init(e:Event = null):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, init);
        NativeApplication.nativeApplication.addEventListener(Event.CLOSING, onExit);
        this.stage.align = StageAlign.TOP_LEFT;
        this.stage.scaleMode = StageScaleMode.NO_SCALE;
        mainSprite = new objectionAppSprite();
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

        mainSprite.button1.addEventListener(MouseEvent.CLICK, onButton1Click);
        mainSprite.button2.addEventListener(MouseEvent.CLICK, onButton2Click);
        mainSprite.button3.addEventListener(MouseEvent.CLICK, onButton3Click);
        mainSprite.button4.addEventListener(MouseEvent.CLICK, onButton4Click);
        mainSprite.button5.addEventListener(MouseEvent.CLICK, onButton5Click);

        video1Sprite = new slam();
        video1Sprite.video.autoPlay = false;
        video1Sprite.video.stop();
        video1Sprite.video.source = new File(File.applicationDirectory.url + "slam.flv").url;
        video1Sprite.width = mainSprite.image.width;
        video1Sprite.height = mainSprite.image.height;
        video1Sprite.x = mainSprite.image.x - mainSprite.image.width / 2;
        video1Sprite.y = mainSprite.image.y - mainSprite.image.height / 2;

        video2Sprite = new slam();
        video2Sprite.video.autoPlay = false;
        video2Sprite.video.stop();
        video2Sprite.video.source = new File(File.applicationDirectory.url + "objection.flv").url;
        video2Sprite.width = mainSprite.image.width;
        video2Sprite.height = mainSprite.image.height;
        video2Sprite.x = mainSprite.image.x - mainSprite.image.width / 2;
        video2Sprite.y = mainSprite.image.y - mainSprite.image.height / 2;

        video3Sprite = new slam();
        video3Sprite.video.autoPlay = false;
        video3Sprite.video.stop();
        video3Sprite.video.source = new File(File.applicationDirectory.url + "holdit.flv").url;
        video3Sprite.width = mainSprite.image.width;
        video3Sprite.height = mainSprite.image.height;
        video3Sprite.x = mainSprite.image.x - mainSprite.image.width / 2;
        video3Sprite.y = mainSprite.image.y - mainSprite.image.height / 2;

        video4Sprite = new slam();
        video4Sprite.video.autoPlay = false;
        video4Sprite.video.stop();
        video4Sprite.video.source = new File(File.applicationDirectory.url + "takethat.flv").url;
        video4Sprite.width = mainSprite.image.width;
        video4Sprite.height = mainSprite.image.height;
        video4Sprite.x = mainSprite.image.x - mainSprite.image.width / 2;
        video4Sprite.y = mainSprite.image.y - mainSprite.image.height / 2;

        video5Sprite = new slam();
        video5Sprite.video.autoPlay = false;
        video5Sprite.video.stop();
        video5Sprite.video.source = new File(File.applicationDirectory.url + "gotcha.flv").url;
        video5Sprite.width = mainSprite.image.width;
        video5Sprite.height = mainSprite.image.height;
        video5Sprite.x = mainSprite.image.x - mainSprite.image.width / 2;
        video5Sprite.y = mainSprite.image.y - mainSprite.image.height / 2;
    }

    private function onExit(e:Event = null):void {
        NativeApplication.nativeApplication.removeEventListener(Event.CLOSING, onExit);

        mainSprite.button1.removeEventListener(MouseEvent.CLICK, onButton1Click);
        mainSprite.button2.removeEventListener(MouseEvent.CLICK, onButton2Click);
        mainSprite.button3.removeEventListener(MouseEvent.CLICK, onButton3Click);
        mainSprite.button4.removeEventListener(MouseEvent.CLICK, onButton4Click);
        mainSprite.button5.removeEventListener(MouseEvent.CLICK, onButton5Click);

        removeVideo();
    }

    private function addVideo(sprite:slam):void {
        removeVideo();
        currentVideo = sprite;
        currentVideo.video.play();
        currentVideo.video.addEventListener(VideoEvent.COMPLETE, onVideoTimer);
        this.addChild(currentVideo);
        mainSprite.image.visible = false;
    }

    private function removeVideo():void {
        if (currentVideo) {
            currentVideo.video.removeEventListener(VideoEvent.COMPLETE, onVideoTimer);
            this.removeChild(currentVideo);
            currentVideo = null;
        }
        mainSprite.image.visible = true;
    }

    private function onVideoTimer(event:Event = null):void {
        removeVideo();
    }

    private function onButton1Click(event:Event = null):void {
        addVideo(video1Sprite);
    }

    private function onButton2Click(event:Event = null):void {
        addVideo(video2Sprite);
    }

    private function onButton3Click(event:Event = null):void {
        addVideo(video3Sprite);
    }

    private function onButton4Click(event:Event = null):void {
        addVideo(video4Sprite);
    }

    private function onButton5Click(event:Event = null):void {
        addVideo(video5Sprite);
    }

}
}
