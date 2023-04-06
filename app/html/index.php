<?php
    error_reporting(0);

    require '../vendor/autoload.php';
    require '../config.php';
    
    $router = new \Bramus\Router\Router();

    $router->before('GET', '/.*', function () {
        header('X-Powered-By: SwipeFolios/1.0');
        header('Content-Type: application/json');
    });
    
    $router->before('POST', '/.*', function () {
        header('X-Powered-By: SwipeFolios/1.0');
        header('Content-Type: application/json');
    });

    $router->set404(function () {
        header('HTTP/1.1 404 not found');
        echo json_encode(["status"=>404,"status_text"=>"not found"]);
    });

    $router->mount('/swipe-portal', function () use ($router) {
        
        $router->get('/', function () {

            if(!checkAuth()){
                die(json_encode(["status"=>403,"status_text"=>"forbidden"]));
            }
            echo json_encode(["status"=>200,"available_section"=>["logs","employers","tasks"]]);

        });

        $router->get('/logs', function () {

            if(!checkAuth()){
                die(json_encode(["status"=>403,"status_text"=>"forbidden"]));
            }            echo select('logs');

        });

        $router->get('/employers', function () {

            if(!checkAuth()){
                die(json_encode(["status"=>403,"status_text"=>"forbidden"]));
            }
            echo select('employers');

        });

        $router->get('/tasks', function () {

            if(!checkAuth()){
                die(json_encode(["status"=>403,"status_text"=>"forbidden"]));
            }
            echo select('tasks');

        });

        $router->post('/images', function () {

            if(!checkAuth()){
                die(json_encode(["status"=>403,"status_text"=>"forbidden"]));
            }

            if (!isset($_FILES['image'])) {
                echo json_encode(["status"=>404,"status_text"=>"not found image"]);
                die;
            }

            $file = $_FILES['image'];
            $name = strtolower($file['name']);
            $type = $file['type'];
            $ext = end(explode(".",$name));

            if (6000<$file['size']) {
                echo json_encode(["status"=>403,"status_text"=>"forbidden, invalid size."]);
                die;
            }

            if ($ext != 'png' && $ext != 'jpg') {
                echo json_encode(["status"=>403,"status_text"=>"forbidden, invalid extension."]);
                die;
            }

            $dir = 'uploads/';
            $image_name = md5(sha1(rand(10000,99999))).'_'.md5(sha1(rand(10000,99999))).'.'.$ext;

            if (move_uploaded_file($file['tmp_name'],$dir.$image_name)) {
                echo json_encode(["status"=>200,"url"=>$dir.$image_name]);
            } else {
                echo json_encode(["status"=>500]);
            }
            
        });

        $router->mount('/tasks',function() use ($router){

            $router->post('/new',function(){

                if(!checkAuth()){
                    die(json_encode(["status"=>403,"status_text"=>"forbidden"]));
                }
                try{
                        $xml = file_get_contents('php://input');
                        $data = new SimpleXMLElement($xml, 2, 0);

                        if ($data == null){
                                echo json_encode(["status"=>500,"status_text"=>"error in parsing XML."]);
                                die;
                        }
                }catch(Exception $e){
                        echo json_encode(["status"=>500,"message"=>"Error in parsing XML"]);
                        exit;
                }

                if ($data->task_name!="" && $data->task_deadline!="" && $data->task_authors!="") {
                    echo insert('tasks',[$data->task_name,$data->task_deadline,$data->task_authors],['task_name','task_deadline','task_authors']);
                } else {
                    echo json_encode(["status"=>500]);
                }

            });

            $router->delete('/delete',function(){

                if (!checkAuth()) {
                    die(json_encode(["status"=>403,"status_text"=>"forbidden"]));
                }

                if (isset($_REQUEST['id'])) {
                    echo remove('tasks',[$_REQUEST['id']],'task_id=?');
                } else {
                    echo json_encode(["status"=>500]);
                }

            });

        });

    });

    $router->run();
