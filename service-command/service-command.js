const a4_0x518e=['prototype','winston','listenCharacteristic','uuid','799d5f0d-0002-0000-a6a2-da053e2a640a','characteristics','./characteristic-response','receivedListenText','./characteristic-request','util','./characteristic-command','./characteristic-listen','responseCharacteristic','writeResponseObject'];(function(_0x5eee2f,_0x1c0039){const _0x27ae94=function(_0x4be4f6){while(--_0x4be4f6){_0x5eee2f['push'](_0x5eee2f['shift']());}};_0x27ae94(++_0x1c0039);}(a4_0x518e,0x17c));const a4_0x247e=function(_0x5eee2f,_0x1c0039){_0x5eee2f=_0x5eee2f-0x0;let _0x27ae94=a4_0x518e[_0x5eee2f];return _0x27ae94;};const util=require(a4_0x247e('0x7'));const winston=require(a4_0x247e('0xd'));const bleno=require('bleno');const BlenoPrimaryService=bleno['PrimaryService'];const CommandCharacteristic=require(a4_0x247e('0x8'));const RequestCharacteristic=require(a4_0x247e('0x6'));const ResponseCharacteristic=require(a4_0x247e('0x4'));const ListenCharacteristic=require(a4_0x247e('0x9'));function CommandService(_0x52fa1c,_0x3378f8){var _0x5f3239=new CommandCharacteristic(_0x52fa1c,this);var _0x1e2b93=new RequestCharacteristic(_0x52fa1c,this,_0x3378f8);var _0x482838=new ResponseCharacteristic(_0x52fa1c,this);var _0x29733e=new ListenCharacteristic(_0x52fa1c);CommandService['super_']['call'](this,{'uuid':a4_0x247e('0x2'),'characteristics':[_0x5f3239,_0x1e2b93,_0x482838,_0x29733e]});this[a4_0x247e('0xa')]=_0x482838;this['listenCharacteristic']=_0x29733e;}CommandService[a4_0x247e('0xc')][a4_0x247e('0xb')]=function(_0x12f4d3){this[a4_0x247e('0xa')][a4_0x247e('0xb')](_0x12f4d3);};CommandService['prototype'][a4_0x247e('0x5')]=function(_0x3b5876){this[a4_0x247e('0x0')][a4_0x247e('0x5')](_0x3b5876);};util['inherits'](CommandService,BlenoPrimaryService);module['exports']=CommandService;