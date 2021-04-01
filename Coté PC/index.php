<?php // content="text/plain; charset=utf-8"
header( "refresh:1" );
include ('jpgraph\src\jpgraph.php');
include ('jpgraph\src\jpgraph_line.php');

$db = new SQLite3('DataTemp.db');
//$version = $db->querySingle('SELECT SQLITE_VERSION()');
$db->exec("CREATE TABLE IF NOT EXISTS Temperature(id INTEGER PRIMARY KEY, date_donnee DATE, donnee FLOAT)");

$fp = fopen("COM6", "w+");

if(!$fp) {
        echo "Error";
        die();
}else{
        sleep(1);
        $resultat = fread($fp,10);      
        while($resultat==NULL){
            $resultat = fread($fp,10);
        }
        $resultat = intval($resultat)/10;
        $date_temp = date("Y-m-d H:i:s");
        //echo $resultat;
        $db->exec("INSERT INTO Temperature(id, date_donnee, donnee) VALUES(NULL, '$date_temp', '$resultat')"); 
    
}

fclose($fp);

class MyDB extends SQLite3
{
    function __construct()
    {
        $this->open("DataTemp.db");
    }
}

$db = new MyDB();

$result = $db->query('SELECT * FROM Temperature');
$row = $result->fetchArray();

$datay1 = array();

while ($row = $result->fetchArray()) {
    $datay1[] = $row['donnee'];
}

// Setup the graph
$graph = new Graph(1000,500);
$graph->SetScale("textlin");

$theme_class=new UniversalTheme;

$graph->SetTheme($theme_class);
$graph->img->SetAntiAliasing(false);
$graph->title->Set('Temperature');
$graph->SetBox(false);

$graph->SetMargin(40,20,36,63);

$graph->img->SetAntiAliasing();

$graph->yaxis->HideZeroLabel();
$graph->yaxis->HideLine(false);
$graph->yaxis->HideTicks(false,false);
$graph->SetScale('textlin',5,25);
$graph->xgrid->Show();
$graph->xgrid->SetLineStyle("solid");
//$graph->xaxis->Hide();
$arrX = array();

$graph->xaxis->SetTickLabels($arrX);

$graph->xgrid->SetColor('#E3E3E3');

// Create the first line
$p1 = new LinePlot($datay1);
$graph->Add($p1);
$p1->SetColor("#6495ED");
$p1->SetLegend('Line 1');

$graph->legend->SetFrameWeight(1);

// Output line
$graph->Stroke();

?>