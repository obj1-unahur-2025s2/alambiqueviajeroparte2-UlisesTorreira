import elAlambiqueViajero.*

object inscripcion {
    const inscriptos = []
    const rechazados = []
    var property carrera = paris

    method inscribirAuto(unAuto)     { inscriptos.add([unAuto]) }
    method rechazarAuto(unAuto)      { rechazados.add([unAuto]) }
    method cambioDeCiudad(unaCiudad) {   carrera = unaCiudad    }
    method replanificacionDeCarrera() {
            inscriptos.clear()
            rechazados.clear()
    }
    method nuevaVerificacionDeInscripcion(unAuto) { self.inscribirAuto(unAuto) }
    method nuevaVerificacionDeRechazo(unAuto)     { self.rechazarAuto(unAuto)  }  
     



}