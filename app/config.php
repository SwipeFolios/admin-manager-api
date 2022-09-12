<?php 
$host = 'admapi-db';
$db   = 'apiadm';
$user = 'apiadm_user';
$pass = '3cfd5296bd6986408e4da269f47fd3a8';
$port = '3306';
$charset = 'utf8mb4';

$options = [
    PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES=>false
];

$dsn = "mysql:host=$host;dbname=$db;charset=$charset;port=$port;";
$pdo = new PDO($dsn, $user, $pass, $options);
$version = "1.0";


function select($table_name,$clmns="*"){
    
    global $pdo;

    $sql = "SELECT $clmns FROM $table_name";  

    try {

        $select = $pdo->prepare($sql);
        $select->execute();
        $res = $select->fetchAll();

        return json_encode(["status"=>200,"result"=>$res]);

    } catch(Exeception $e) {

        return json_encode(["status"=>500,"status_text"=>$e->getMessage()]);
        
    }

}

function insert($tableName,$values,$parameters=''){
    
    global $pdo;
    $queSymbol='';

    for ($i=0;$i<=count($values)-1;$i++) {

        $queSymbol.='?';
        if ($i!==count($values)-1) {
            $queSymbol.=',';
        }

    }

    if (is_array($parameters)) {

        if (count($parameters)==count($parameters)) {

            $sql = "INSERT INTO $tableName (".implode(',',$parameters).") VALUES ($queSymbol)";

        } else {

            return json_encode(["status"=>500,"status_text"=>"Error in parameters"]);

        }

    } else {
        $sql = "INSERT INTO $tableName VALUES ($queSymbol)";
    }    

    if (isset($sql)) {

        try {

            $insert = $pdo->prepare($sql)->execute($values);

        } catch(Exception $e) {

            return json_encode(["status"=>500,"status_text"=>$e->getMessage()]);

        }
        
    }

    return json_encode(["status"=>200]);

}

function remove($tableName,$parameterValues,$conditionString='id=?'){

    global $pdo;

    if (is_array($parameterValues)){

        $sql = "DELETE FROM $tableName WHERE $conditionString";

        try {

            $delete = $pdo->prepare($sql)->execute($parameterValues);
            return json_encode(["status"=>200]);
            
        } catch(Exception $e) {

            return json_encode(["status"=>500,"status_text"=>$e->getMessage()]);

        }

    } else {
        return json_encode(["status"=>500]);
    }
}


function checkAuth(){

    if ( isset($_SERVER['HTTP_X_AUTH']) ) {

        $auth = false;
        $tokens = json_decode(select('tokens','token'))->result;

        foreach ($tokens as $token) {

            if ( $_SERVER['HTTP_X_AUTH'] === $token->token ){
                return 1;
            }

        }

    }

    return 0;

}