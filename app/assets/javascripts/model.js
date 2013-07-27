//=require jqueryform
//=require three
//=require orbitcontrols
function success(response) {
  if(response != "") {
    location.reload(false)
  } else {
    alert("failed to add comment")
  }
}





$(document).ready(function() {
  var options = {
    clearForm:true,
    success: success
  };

  $('#comment-form').ajaxForm(options);

  $('.canvas-zone').width(window.innerWidth - $('.sidebar').width());
  $('.canvas-zone').height(window.innerHeight - 60);

  var container;

  var camera, controls, scene, renderer;

  var cross;

  init();
  animate();

  function init() {

    camera = new THREE.PerspectiveCamera( 60, window.innerWidth / window.innerHeight, 1, 1000 );
    camera.position.z = 500;

    controls = new THREE.OrbitControls( camera );
    controls.addEventListener( 'change', render );

    scene = new THREE.Scene();
    scene.fog = new THREE.FogExp2( 0xcccccc, 0.002 );

        // world

        var geometry = new THREE.CylinderGeometry( 0, 10, 30, 4, 1 );
        var material =  new THREE.MeshLambertMaterial( { color:0xffffff, shading: THREE.FlatShading } );

        for ( var i = 0; i < 500; i ++ ) {

          var mesh = new THREE.Mesh( geometry, material );
          mesh.position.x = ( Math.random() - 0.5 ) * 1000;
          mesh.position.y = ( Math.random() - 0.5 ) * 1000;
          mesh.position.z = ( Math.random() - 0.5 ) * 1000;
          mesh.updateMatrix();
          mesh.matrixAutoUpdate = false;
          scene.add( mesh );

        }


        // lights

        light = new THREE.DirectionalLight( 0xffffff );
        light.position.set( 1, 1, 1 );
        scene.add( light );

        light = new THREE.DirectionalLight( 0x002288 );
        light.position.set( -1, -1, -1 );
        scene.add( light );

        light = new THREE.AmbientLight( 0x222222 );
        scene.add( light );


        // renderer

        renderer = new THREE.WebGLRenderer( { antialias: false } );
        renderer.setClearColor( scene.fog.color, 1 );
        renderer.setSize( window.innerWidth - $('.sidebar').width(), window.innerHeight - 60 );

        container = $('.canvas-zone')[0]
        container.appendChild( renderer.domElement );


        //

        window.addEventListener( 'resize', onWindowResize, false );

      }

      function onWindowResize() {

        camera.aspect = window.innerWidth - $('.sidebar').width() / window.innerHeight - 60;
        camera.updateProjectionMatrix();

        renderer.setSize( window.innerWidth - $('.sidebar').width(), window.innerHeight - 60);

        render();

      }

      function animate() {

        requestAnimationFrame( animate );
        controls.update();

      }

      function render() {

        renderer.render( scene, camera );
      }

    });