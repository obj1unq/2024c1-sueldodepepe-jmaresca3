object pepe {
	var categoria = cadete	
	var bonoResultados = nulo
	var bonoPresentismo = nulo
	var faltas = 0
	method sueldo(){	
		return self.neto() + bonoResultados.valor(self) + bonoPresentismo.valor(self)
	}
	method neto(){
		return categoria.neto()
	}
	method categoria(_categoria){
		categoria = _categoria
	}
	method bonoResultadosEs(_bonoResultados){
		bonoResultados = _bonoResultados
	}
	method bonoPresentismoEs(_bonoPresentismo){
		bonoPresentismo = _bonoPresentismo
	}
	method faltas(_faltas){
		faltas += _faltas
	}
	method faltas(){
		return faltas
	}
}

object sofia {
	var categoria = cadete
	var bonoResultados = nulo
	method sueldo(){
		return self.neto() + bonoResultados.valor(self) + self.netoIncrementado()
	}
	method neto(){
		return categoria.neto()
	}
	method categoria(_categoria){
		categoria = _categoria
	}
	method bonoResultadosEs(_bonoResultados){
		bonoResultados = _bonoResultados
	}
	method netoIncrementado(){
		return self.neto()*0.3
	}
}

object roque {
	var bonoResultados = nulo
	method sueldo(){
		return self.neto() + bonoResultados.valor(self) + 9000
	}
	method bonoResultadosEs(_bonoResultados){
		bonoResultados = _bonoResultados
	}
	method neto(){
		return 28000
	}
}

object ernesto {
	var companiero = pepe 
	var bonoPresentismo = normal
	const faltas = 0
	method sueldo(){
		return companiero.neto() + bonoPresentismo.valor(self)
	}
	method companieroEs(_companiero){
		companiero = _companiero 
	}
	method bonoPresentismoEs(_bonoPresentismo){
		bonoPresentismo = _bonoPresentismo
	}
	method faltas(){
		return faltas
	}
}

////// Categorias //////

object cadete {
	method neto() {
		return 20000
	}
}

object gerente {
	method neto(){
		return 15000
	}
}

object vendedor {
	var netoBase = 16000
	var muchasVentas = false
	method neto(){
		return netoBase + self.incrementoPorVentas()
	}
	method incrementoPorVentas(){
		return if(muchasVentas) netoBase*0.25 else 0 
	}
	method activarAumentoPorMuchasVentas(){
		muchasVentas = true
	}
	method desactivarAumentoPorMuchasVentas(){
		muchasVentas = false
	}
}

object medioTiempo {
	var categoriaBase = cadete
	method categoriaBase(_categoriaBase){
		categoriaBase = _categoriaBase
	}
	method neto(){
		return categoriaBase.neto()/2
	}
}

object nulo{
	method valor(unEmpleado){
		return 0
	} 
}

////// Bono x Resultados //////

object montoFijo {
	method valor(unEmpleado){
		return 800
	}
}

object porcentaje {
	const porcentaje = 0.1
	method valor(unEmpleado){
		return unEmpleado.neto()*porcentaje
	}
}

////// Bono x Presentismo //////

object normal {
	method valor(unEmpleado){
		return if (unEmpleado.faltas() == 0){
			2000 
			}else if (unEmpleado.faltas() == 1){
				1000
			} else 0
	}
}

object ajuste {
	method valor(unEmpleado){
		return if(unEmpleado.faltas()==0) 100 else 0
	}
}

object demagogico { 
	method valor(unEmpleado){
		return if(unEmpleado.neto()<18000) 500 else 300
	}
}
