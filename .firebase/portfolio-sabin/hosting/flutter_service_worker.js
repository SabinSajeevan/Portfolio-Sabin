'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "2b4bdf76b7dbdfbab4486365029227ed",
"favicon.ico": "4e3cecb6c4e73e7cdff59f59d77e05df",
"index.html": "f0ad2ae8cf1124b64b127ea565dd83bf",
"/": "f0ad2ae8cf1124b64b127ea565dd83bf",
"main.dart.js": "f0f5865a7cbb1fb1394799ec324bb2df",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "6b58a724dee9069cf85435e4eb120d7b",
"assets/AssetManifest.json": "1aece21e875c3c8dae0b62b1745ff98f",
"assets/NOTICES": "b258f34cbf75a05fbc0a672c143616a0",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "27f027fdc1495b86341175f2c9fe3f15",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "e011ec268e8fe786560a6519133c0c68",
"assets/fonts/MaterialIcons-Regular.otf": "a31c70a03961ce35ac38c672c938b079",
"assets/assets/images/profile_image.jpg": "f0640eb08ac38a58100aebaa2a7aac4c",
"assets/assets/images/projects/moneypool/moneypool3.png": "0125cce50e88d47535173a316fdd0663",
"assets/assets/images/projects/moneypool/moneypool2.png": "aa9c883ecbcef3fb83323fc7196666ee",
"assets/assets/images/projects/moneypool/moneypool1.png": "402ff484880d47befb3dae8c762bdc28",
"assets/assets/images/projects/moneypool/moneypool5.png": "3b2278b0f458e45f2e3421bc587c83ca",
"assets/assets/images/projects/moneypool/moneypool4.png": "8fb77068031629ac8685043fd4a7173a",
"assets/assets/images/projects/divine_bullion/divine_bullion1.png": "74fe94c130dd666b3cdf64aa1a08bff5",
"assets/assets/images/projects/divine_bullion/divine_bullion3.png": "6d73e19b486cab7d82098f9860f09f07",
"assets/assets/images/projects/divine_bullion/divine_bullion2.png": "cf2b1446377e71117004b5b1cac11e89",
"assets/assets/images/projects/divine_bullion/divine_bullion5.png": "8bb1b5bb1758a06ef479289336eee61e",
"assets/assets/images/projects/divine_bullion/divine_bullion4.png": "c63d8c0341d97f4ddd09f0174f6b7ed5",
"assets/assets/images/projects/scully/scully3.png": "fabf7de4143c062ecd058fbbd2371095",
"assets/assets/images/projects/scully/scully2.png": "33c32180ff445ac811b12a633d2a0681",
"assets/assets/images/projects/scully/scully1.png": "c95ae277721ddcb511589dbfc2d552d2",
"assets/assets/images/projects/scully/scully5.png": "908067604387c8894144a81317ab1ad7",
"assets/assets/images/projects/scully/scully4.png": "4ea6796c23406906aba62c0ddd2a5dcf",
"assets/assets/images/projects/agl/agl4.png": "7835a095733ae07094147a907a354384",
"assets/assets/images/projects/agl/agl5.png": "e0566aca0df842d41bdb39e6cfbb0f09",
"assets/assets/images/projects/agl/agl2.png": "beda9dfbd0b6f3a0522463cb4f37b22a",
"assets/assets/images/projects/agl/agl3.png": "c2343b6dec47737cc9b024de2f8d9540",
"assets/assets/images/projects/agl/agl1.png": "616d4ce1459d9c3cc2ecbe86ef5648b0",
"assets/assets/images/projects/figma2flutter/figma2flutter5.png": "a0b339346250be45687bc82a109ecbef",
"assets/assets/images/projects/figma2flutter/figma2flutter4.png": "02030441be1db0bf5a150abca4880a17",
"assets/assets/images/projects/figma2flutter/figma2flutter3.png": "896976d392eb3f92dc6d10b1de6731f0",
"assets/assets/images/projects/figma2flutter/figma2flutter2.png": "792a75c3afbe281edc4894bee2392663",
"assets/assets/images/projects/figma2flutter/figma2flutter1.png": "2e5902438aab6888c2d04cc95c24d22c",
"assets/assets/animation/badminton.json": "54359d91bc6eb446b2b065a6a7aa743d",
"assets/assets/animation/travel.json": "fb254e1837df8a626eb4b428f0333590",
"assets/assets/animation/movies.json": "af2e055018a2fdcf9cb829102252096e",
"assets/assets/animation/android.json": "4c29861118babb5095e2ba5561d1cc53",
"assets/assets/animation/flutter.json": "7b77f3810a747663ea317882bd368433",
"assets/assets/animation/instagram.json": "6491a0ffafa67181617a27fcbfa7887d",
"assets/assets/animation/cricket.json": "fa84eff59a8e5e73cd1d47ffbed18a7b",
"assets/assets/animation/welcome.json": "78ac8470d059d8b186a4eec6469e78fd",
"assets/assets/animation/laravel.json": "84aae1688bdef2fb53a1ce83368006a2",
"assets/assets/animation/uiux.json": "2a0472904ed7c6e07ff3e51cecc063a6",
"assets/assets/animation/emoji_eye_blink.json": "fe5bc30d091cf4f02da97676a066b460",
"assets/assets/animation/php.json": "803a1f3474182ec03348dbde851306c8",
"assets/assets/animation/address.json": "a014997d1b91456be95b772d7f2767b2",
"assets/assets/animation/emoji_with_glass.json": "903767b98646464ef856d4f1d6fa0067",
"assets/assets/animation/whatsapp.json": "94e7858f184d819efcee8bb485a3e418",
"assets/assets/animation/emoji_love_eye.json": "a046ddb830ea344a1cc1026d60ec7db9",
"assets/assets/animation/firebase.json": "0be4e1c612931d30278537ddf63bd969",
"assets/assets/animation/email.json": "631d8c2277779796c53814bc5d65428c",
"assets/assets/animation/phone.json": "687387c37f598c7af2bdd0a55eb47888",
"assets/assets/animation/linkedin.json": "d9b3f868a9bdec2d75f4bfa36205523e",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
