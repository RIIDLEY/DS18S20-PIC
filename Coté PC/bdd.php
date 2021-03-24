<?php
$db = new SQLite3('temp.db');
//$version = $db->querySingle('SELECT SQLITE_VERSION()');
$db->exec("CREATE TABLE IF NOT EXISTS Temperature(id INTEGER PRIMARY KEY, date_donnee DATE, donnee FLOAT)");


///////////////////////////////////

$fp = fopen("COM6", "w+");

if(!$fp) {
        echo "Error";
        die();
}else{
    for($i=0; $i<60; $i++){
        sleep(1);   

        $resultat = fread($fp,10);
        $resultat = ord($resultat);
        $resultat = $resultat/10;
        $date_temp = date("H:i:s");
        echo ("Température à " . $date_temp . ": \t");
        echo ("  ");
        echo $resultat;
        $db->exec("INSERT INTO Temperature(id, date_donnee, donnee) VALUES(NULL, '$date_temp', '$resultat')");
        echo "<br>";
    }
    
}

fclose($fp);





//header("Refresh:0");
?>

