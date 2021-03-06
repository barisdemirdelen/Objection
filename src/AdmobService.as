package {
import flash.system.Capabilities;

import so.cuo.platform.admob.Admob;
import so.cuo.platform.admob.AdmobEvent;
import so.cuo.platform.admob.AdmobPosition;

/**
 * ...
 * @author Barış Demirdelen
 */
public class AdmobService {

    protected var _admob:Admob;

    protected function initialize():void {
        if (!_admob) {
            _admob = Admob.getInstance(); //create a instance
            trace(_admob.supportDevice);
            if (!_admob.supportDevice) {
                return;
            }
            if (Capabilities.manufacturer.toLowerCase().indexOf("ios") != -1) { //ios
                _admob.setKeys("ca-app-pub-7819139870608872/7050936050")
            } else {
                _admob.setKeys("ca-app-pub-7819139870608872/5434602056")
            }
            _admob.addEventListener(AdmobEvent.onBannerReceive, onAdReceived);
            _admob.addEventListener(AdmobEvent.onBannerFailedReceive, onAdFailed);
            _admob.enableTrace = Capabilities.isDebugger;
        }
    }

    public function showAds():void {
        if (!_admob) {
            initialize();
        }
        if (_admob.supportDevice) {
            _admob.showBanner(Admob.SMART_BANNER, AdmobPosition.BOTTOM_CENTER);
        }

    }

    public function hideAds():void {
        _admob.hideBanner();
    }

    private function onAdFailed(e:AdmobEvent):void {
        trace(e.data);
    }

    private function onAdReceived(e:AdmobEvent):void {
        trace(e.data.width, e.data.height);
    }

}

}