<?php
include_once('../clsHoja_verificacion.php');
include_once('../clsAccion.php');
include_once('../clsDetalle_accion.php');
include_once('../clsManipulacion_dilucion.php');
include_once('../clsMantenimiento_limpieza.php');
include_once('../clsControl_indice.php');
include_once('../clsLinea_genetica.php');
include_once('../clsViabilidad_celular.php');



$id_hoja=$_GET['id'];

$hoja_verificacion=New Hoja_verificacion();
$accion= New Accion();
$manipulacion_dilucion=New Manipulacion_dilucion();
$control_indice=New Control_indice();
$linea_genetica=New Linea_genetica();
$viabilidad_celular=New Viabilidad_celular();
$mantenimiento_limpieza=New Mantenimiento_limpieza();

$rpt_hoja=$hoja_verificacion->get_formulario_por_id($id_hoja);
$rpt_accion=$accion->get_formulario_por_id_hoja($id_hoja);
$rpt_manipulacion_dilucion=$manipulacion_dilucion->get_formulario_por_id_hoja($id_hoja);
$rpt_control_indice=$control_indice->get_formulario_por_id_hoja($id_hoja);
$rpt_viabilidad_celular=$viabilidad_celular->get_formulario_por_id_hoja($id_hoja);
$rpt_linea_genetica=$linea_genetica->get_formulario_por_id_hoja($id_hoja);
$rpt_mantenimiento_limpieza=$mantenimiento_limpieza->get_formulario_por_id_hoja($id_hoja);
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>AUDITORIA DE VACUNACION</title>
     <style type="text/css">
       #tabla_contenido,#tabla_puntuacion{
        border:1px solid #000; 
        margin: 5px;
        align-content: top;
        background: #d9ffcc;
       }
       #tabla_puntuacion
       {
        width: 350px;
       }
       th, #tr_cabecera{
         background-color: #4CAF50;
        color: white;
         border: 2px solid #000;
        height: 50px;

       }
       #tr_cabecera>td
       {

        color: black;
       }
       #tabla_contenido tr ,#tabla_contenido tr td, #accion tr td,#manipulacion tr td,#control tr td
       {
        border: 1px solid #000;
        padding-left: 8px;

       }
        #irregularidades tr th
       {
        border: 0px solid #000;
        padding-left: 8px;
        width: 700px;

       }
       #irregularidades tr td
       {
        border: 2px solid #000;
        padding-left: 8px;
        border-bottom: 1px;
         border-left: 1px;
         width: 70px;
       

       }
       td{
        height: 40px;
     
       }
       div{
        height: 100%;
       }
       table
       {
        border-collapse: collapse;
       
       }
       body{
         font-family: arial;
       }
       #accion
       {
        width: 400px;
       }
       #ire ,#ire_l
       {
        border: 1px solid #000;
        text-align: center;
        padding: 0px;
       }
     </style>
  </head>
  <body>
    <header class="clearfix">
    <TABLE>
      <tr>
        <td>
          <img style="width: 50px; height: 50px" src="imagen/invetsa.png">
         </td>
         <td>
         <h2 align="center">AUDITORIA DE VACUNACION</h2>
         <h3 align="center">Inversion Veterinaria S.A.</h3>
        </td>
        <td>
         <font color="RED" >Nro:<?php echo $rpt_hoja->id;?></font><br>
         Codigo: <?php echo $rpt_hoja->codigo;?> <br>
         Revision: <?php echo $rpt_hoja->revision;?><br>
        </td>
      </tr>
      <tr>
        <td style="text-align: left;">
         <b>Hora ingreso:<?php echo $rpt_hoja->hora_ingreso; ?> </b> <br>
         <b>Hora salida:</b><?php echo $rpt_hoja->hora_salida; ?><br>
         <b>Empresa: </b><?php echo $rpt_hoja->empresa; ?> años<br>
         <b>Unidad: </b><?php echo $rpt_hoja->unidad;?><br>
         <b>Responsable de Invetsa:</b> <?php echo $rpt_hoja->responsable_invetsa;?><br>
        </td>
        <td style="text-align: left;" colspan="2">
        <b> Fecha:</b> <?php echo $rpt_hoja->fecha; ?><br>
        <b> Responsable Incubadora:</b> <?php echo $rpt_hoja->responsable_incubadora; ?><br>
        </td>
      </tr>


    </TABLE>

    </header>
    <main>
    <h3>1.- INSPECCION VISUAL</h3>
      <table id=tabla_contenido>
          <tr id=tr_cabecera>
            <th>LINEA GENETICA</th>
            <th>COBB</th>
            <th>ROSS </th>
            <th>HYBRO</th>
          </tr>
          <?php
            echo "<tr>
                  <td>$rpt_linea_genetica->descripcion</td>
                  <td>$rpt_linea_genetica->cobb</td>
                  <td>$rpt_linea_genetica->ross</td>
                  <td>$rpt_linea_genetica->hybro</td>
                  </tr>
                  ";
          ?>  


      </table>
      <br>
      <?php 
        while ($fila_accion=mysqli_fetch_object($rpt_accion)) {
          echo "<table id=accion> 
          <tr>
          <th colspan=2>$fila_accion->nombre</th>
          </tr>";
      ?>
      
        <tr id=tr_cabecera>
          <td><b>ESPERADO</b></td>
          <td><b>ENCONTRADO</b></td>
        </tr>
        <?php
        $id_accion=$fila_accion->id;
        $rpt_detalle_accion=New Detalle_accion();
        $rpt_detalle_accion=$rpt_detalle_accion->get_formulario_por_id_hoja_y_id_accion($id_hoja,$id_accion);
          while ($fila=mysqli_fetch_object($rpt_detalle_accion)) {
          echo "
            <tr>
            <td>$fila->esperado</td>
            <td>$fila->encontrado</td>
            </tr>
          ";
          }
      
      echo "</TABLE><br>";
       } ?>


        <br>
    <hr>
          <table id=manipulacion> 
          <tr>
          <th colspan=3>MANIPULACION Y DILUCION DE LA VACUNA CONGELADA</th>
          </tr>
    
      
        <tr id=tr_cabecera>
          <td colspan="2"><b>Asigna con (x)si el procedimiento estuviese siendo seguido:(Puntaje M&aacute;ximo 2.0) <b></td>
          <td><b>PUNTAJE</b></td>
        </tr>
        <?php
          while ($fila=mysqli_fetch_object($rpt_manipulacion_dilucion)) {
          echo "
            <tr>
            <td>$fila->id</td>
            <td>$fila->descripcion</td>
            <td>$fila->puntaje</td>
            </tr>
          ";
          }
          echo "<tr id=tr_cabecera>
            <td></td>
            <td><b>SUMATORIA</b></td>
            <td><b>$rpt_hoja->sumatoria_manipulacion_vacuna</b></td>
          </tr>";
        ?>
      </TABLE><br>
      <hr>

<h3>MANTENIMIENTO Y LIMPIEZA DE EQUIPOSDE VACUNACION</h3>
     Asignar con una (x) kas irregularidades encontradas: (Puntaje Promedio 1.5)<br>  
          <table id=manteminimiento > 
          <tr>
          <th >Nombre del Vacunador</th>
          <th >Nº de Maquina</th>
          <th colspan="15">
          <table id="irregularidades">
          <th colspan="15">IRREGULARIDADES</th>
          <tr>
            <td>1</td>
            <td>2</td>
            <td>3</td>
            <td>4</td>
            <td>5</td>
            <td>6</td>
            <td>7</td>
            <td>8</td>
            <td>9</td>
            <td>10</td>
            <td>11</td>
            <td>12</td>
            <td>13</td>
            <td>14</td>
            <td>15</td>
          

          </tr></table>
          </th>
          </tr>


     
        <?php
          while ($fila=mysqli_fetch_object($rpt_mantenimiento_limpieza)) {
          echo "
            <tr>
            <td id=ire_l >$fila->vacunador</td>
            <td id=ire_l >$fila->nro_maquina</td>
            <td id=ire >$fila->irregularidad1</td>
            <td id=ire >$fila->irregularidad2</td>
            <td id=ire >$fila->irregularidad3</td>
            <td id=ire >$fila->irregularidad4</td>
            <td id=ire >$fila->irregularidad5</td>
            <td id=ire >$fila->irregularidad6</td>
            <td id=ire >$fila->irregularidad7</td>
            <td id=ire >$fila->irregularidad8</td>
            <td id=ire >$fila->irregularidad9</td>
            <td id=ire >$fila->irregularidad10</td>
            <td id=ire >$fila->irregularidad11</td>
            <td id=ire >$fila->irregularidad12</td>
            <td id=ire >$fila->irregularidad13</td>
            <td id=ire >$fila->irregularidad14</td>
            <td id=ire >$fila->irregularidad15</td>
             <td></td>
            </tr>
          ";
          }
         
        ?>
      
        
       
      </TABLE><br>



      <h3>IRREGULARIDADES</h3>
      1.-Acumulo de suciedad o puntos en sucios en la placa de sensores Twin Touch<br>
      2.-Falta de uno o mas tornillos visibles.<br>
      3.-Presi&oacute;n de aire comprimido fuera de rango recomendado(65-75 psi para Twin Shot/Zootec)<br>
      4.-Colocación incorrecta de la aguja (bisel hacia arriba)<br>
      5.-Inadecuada regulación de la salida de la aguja o agujas, que provoca que vacuna quede en la parte interna de la maquina.<br> 
6.-Colocación inadecuada de las jeringas y/o mangueras descartables.<br>
7.-Falta de calibración de la dosis 0.2 ml en Marek y 0.1 ml en Oleosas.<br> 
8.-No verificar la calibración de la dosis de la maquina cada 2,000 pollos vacunados.<br>
9.-No cumplen con el cambio de agujas de la maquina cada 2,000 pollos vacunados.<br>
10.-No tienen asperjadores con alcohol para la limpieza de la maquina cada 500 pollos vacunados.<br>
11.-No se lavan las manos y desinfectan antes de  realizar el cambio de agujas de las maquinas.<br>
12.-Acumulo de suciedad entre el modulo inyector y el modulo inferior de la maquina.<br>
13.-Desarmado incorrecto y lavado inadecuado de las maquinas, uso de detergente y material abrasivos.<br>
14.-Inadecuada esterilización de la válvula de control, debe ser a 121° C, a 15 psi de presión por 20 minutos envuelto en papel craf.<br>
15.-Otras irregularidades. Especificar : <b><?php echo $rpt_hoja->irregularidad_15;?></b><br>
      

<hr>

    
 <h3>CONTROL DE INDICE DE EFICIENCIA DE VACUNACIONY PRODUCTIVIDAD</h3>
     (Puntaje Máximo Índice de Eficiencia  5.5)     
          <table id=control> 
          <tr>
          <th >Nombre del Vacunador</th>
          <th >Nº Pollos Vacunados/Hora</th>
          <th >Puntaje</th>
          <th >Nº Pollos controlados</th>
          <th >Nº Pollos no vacunado</th>
          <th >Heridos</th>
          <th >Mojados</th>
          <th >Mala posición</th>
          <th >Nº Pollos vacunad correctame</th>
          <th >% de Eficiencia</th>
          </tr>
    
      
        
        <?php
          while ($fila=mysqli_fetch_object($rpt_control_indice)) {
          echo "
            <tr>
            <td>$fila->vacunador</td>
            <td>$fila->nro_pollos_vacunado</td>
            <td>$fila->puntaje</td>
            <td>$fila->nro_pollos_controlados</td>
            <td>$fila->nro_pollos_no_vacunados</td>
            <td>$fila->nro_heridos</td>
            <td>$fila->nro_mojados</td>
            <td>$fila->nro_mala_posicion</td>
            <td>$fila->nro_pollos_vacunados_correctamente</td>
             <td></td>
            </tr>
          ";
          }
         
        ?>
      </TABLE>
<?php
echo "
<br>
<hr>
<br>
<h3>PUNTAJE TOTAL OBTENIDO</h3>


<table id=control>
<tr>
  <th colspan='2'> PUNTAJE DE CONTROL</th>
</tr>
<tr>
  <td>MANIPULACION Y DILUCION DE LA VACUNA CONGELADA</td>
  <td> $rpt_hoja->sumatoria_manipulacion_vacuna</td>
</tr>
<tr>
  <td>MANTENIMIENTO Y LIMPIEZA DE LAS VACUNADORAS ACCUVAC</td>
  <td> $rpt_hoja->promedio_mantenimiento</td>
</tr>
<tr>
  <td>INDICE DE EFICIENCIA DE VACUNACION</td>
  <td>$rpt_hoja->puntaje_control_indice</td>
</tr>
<tr>
  <td>PRODUCTIVIDAD</td>
  <td>$rpt_hoja->productividad</td>
</tr>
<tr>
  <td>PUNTAJE TOTAL </td>
  <td>$rpt_hoja->puntaje_total</td>
</tr>
</table>

<br>
<hr>
<h3>VIABILIDAD CELULAR</h3>
<table id=control>
<tr>
  <th>ANTIBIOTICO</th>
  <th>DOSIS</th>
  <th>TIEMPO (min)</th>
  <th>VC % </th>
</tr>
";
while ($fila=mysqli_fetch_object($rpt_viabilidad_celular)) {
  echo "<tr>
      <td>$fila->id</td>
      <td>$fila->dosis</td>
      <td>$fila->tiempo</td>
      <td>$fila->vc</td>
    </tr>
  ";
}
echo"</table><br>

<hr>
<h3>RECOMENDACIONES</h3>
$rpt_hoja->recomendaciones
<br>

<hr>";





$src_imagen_jefe="";
$src_firma_invetsa="";
$src_firma_empresa="";
 if(file_exists("../".$rpt_hoja->firma_invetsa))
{
  $src_firma_invetsa="data:image/jpeg;base64,".file_get_contents("../".$rpt_hoja->firma_invetsa);
}
 if(file_exists("../".$rpt_hoja->firma_empresa))
{
  $src_firma_empresa="data:image/jpeg;base64,".file_get_contents("../".$rpt_hoja->firma_empresa);
}
if(file_exists("../".$rpt_hoja->imagen_jefe))
{
  $src_imagen_jefe="data:image/jpeg;base64,".file_get_contents("../".$rpt_hoja->imagen_jefe);
}

echo "<table id=tabla_contenido>
<tr>
<th>IMAGEN DE JEFE DE PLANTA</th>
</tr>
<tr>
<td>
<img src='$src_imagen_jefe' width=300px/>
</td>
</tr>
</table>
<br>
<br>
<br>
";

echo "<table id=tabla_contenido>
<tr>
<th>FIRMA INVETSA</th>
<th>FIRMA EMPRESA</th>
</tr>
<tr>
<td>
<img src='$src_firma_invetsa' width=300px/>
</td>
<td>
<img src='$src_firma_empresa' width=300px/>
</td>
</tr>
</table>
";
?>
    </main>
    <footer>
  
      Invoice was created on a computer and is valid without the signature and seal.
    </footer>
  </body>
 
</html>