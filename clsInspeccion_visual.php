<?php
include_once('clsConexion.php');
class Inspeccion_visual extends Conexion
{
	//atributos
	private $id;
	private $observaciones;
	private $piezas_cambiadas;
	private $id_servicio;
	private $imei;

	
	//construtor
	public function Inspeccion_visual()
	{   parent::Conexion();
		$this->id=0;
		$this->observaciones="";	
		$this->piezas_cambiadas="";
		$this->id_servicio=0;
		$this->imei="";
	}
	//propiedades de acceso
	public function setId($valor)
	{
		$this->id=$valor;
	}
	public function getId()
	{
		return $this->id;
	}

	public function setObservaciones($valor)
	{
		$this->observaciones=$valor;
	}
	public function getObservaciones()
	{
		return $this->observaciones;
	}
	public function getPiesas_cambiadas()
	{
		return $this->piesas_cambiadas;
	}
	
	public function getId_servicio()
	{
		return $this->id_servicio;
	}

	public function getId_sqlite()
	{
		return $this->id_sqlite;
	}
	public function getImei()
	{
		return $this->imei;
	}
	public function preparar($observaciones,$piezas_cambiadas,$id_servicio,$id,$imei)
	{
		$this->id=$id;
		$this->observaciones=$observaciones;	
		$this->piezas_cambiadas=$piezas_cambiadas;
		$this->id_servicio=$id_servicio;
		$this->imei=$imei;
	}
	public function guardar()
	{
     $sql="insert into inspeccion_visual(observaciones,piezas_cambiadas,id_servicio,id,imei) values('$this->observaciones','$this->piezas_cambiadas','$this->id_servicio','$this->id','$this->imei')";
		
		if(parent::ejecutar($sql))
			return true;
		else
			return false;	
	}
	
	
	
	public function buscar()
	{
		$sql="SELECT * from inspeccion_visual";
		return parent::ejecutar($sql);
	}	
	public function buscar_por_codigo($codigo)
	{
		$sql="SELECT * from inspeccion_visual where codigo='$codigo' limit 1";
		return parent::ejecutar($sql);
	}	
	public function existe_id_sqlite($id_sqlite,$imei)
	{
		$sql="SELECT * from inspeccion_visual where id_sqlite='$id_sqlite' and imei='$imei'";
		$consulta=parent::ejecutar($sql);
		
		if(mysqli_num_rows($consulta) != 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	public function get_id_por_sqlite($id_sqlite,$imei)
	{
		$sql="SELECT id from inspeccion_visual where id_sqlite='$id_sqlite' and imei='$imei' limit 1";
		$consulta=parent::ejecutar($sql);
		
		if(mysqli_num_rows($consulta) != 0)
		{
			return mysqli_fetch_assoc($consulta)['id'];
		}
		else
		{
			return "-1";
		}
	}	
	public function get_formulario_por_id_sm($id_servicio)
	{
		$sql="SELECT * from inspeccion_visual where id_servicio='$id_servicio' order by id asc";
		$consulta=parent::ejecutar($sql);
				
		if(mysqli_num_rows($consulta) != 0 )
		{
			return $consulta;
		}
		else
		{
			return '-1';
		}
	}		
										

	
}    
?>