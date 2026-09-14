# Prompts de ejemplo — ciclo completo

Colección de prompts en español, listos para copiar y pegar, para usar el skill de Principal .NET Architect en los cinco modos: Review, Build, Scorecard, Assessment y Advisory.

---

## 1. Review Mode — diagnóstico inicial

Evalúa código que ya existe. Úsalo para confirmar hallazgos que ya tengas (por ejemplo, de SonarQube) o para descubrir nuevos.

```
Revisa este servicio para producción, con foco en confiabilidad y seguridad.
```

```
Analiza esta clase/controlador en busca de anti-patrones: sync-over-async, CancellationToken faltante, HttpClient mal usado.
```

```
Revisa la capa de infraestructura — ¿hay violaciones de dirección de dependencias contra el dominio?
```

```
Revisa este consumer de mensajería: ¿es idempotente? ¿usa Outbox Pattern?
```

```
Revisa este endpoint: ¿valida entrada del usuario? ¿tiene [Authorize]? ¿expone stack traces en errores?
```

---

## 2. Build Mode — corregir o construir ya conforme al estándar

Úsalo tanto para corregir hallazgos existentes como para escribir código nuevo que ya cumpla el estándar EAF desde el inicio.

```
Corrige este método para propagar context.RequestAborted en lugar de omitir el CancellationToken.
```

```
Reemplaza este CloseAndFlush() síncrono por su versión async, sin cambiar el resto del comportamiento.
```

```
Implementa un endpoint que devuelva una orden por id, siguiendo nuestros estándares de arquitectura y con CancellationToken propagado.
```

```
Crea un repositorio para el agregado Invoice usando Dapper, con manejo correcto de conexiones.
```

```
Agrega un consumer de mensajería para OrderPlaced que publique al outbox.
```

```
Escribe un HttpClient tipado para consumir la API de pagos, con timeout y retry configurados.
```

```
Reemplaza este retry manual (while(true) con Thread.Sleep) por una política de Polly con backoff exponencial y circuit breaker.
```

---

## 3. Scorecard Mode — salud por dominio

Consolida hallazgos en una calificación por dominio (A–F), sin repetir cada hallazgo individual.

```
Dame un scorecard de la capa de persistencia (Database + Performance).
```

```
Genera un scorecard completo con los 11 dominios de la EAF para este servicio.
```

```
Compara el scorecard de este servicio antes y después de las correcciones que acabamos de aplicar.
```

---

## 4. Assessment Mode — decisión formal

Transforma evidencia de ingeniería en una decisión: GO, GO WITH CONDITIONS, NO GO o REASSESS REQUIRED.

```
¿Este servicio está listo para producción? Dame una decisión formal: GO, GO WITH CONDITIONS o NO GO.
```

```
Evalúa el riesgo de desplegar este cambio esta semana, considerando los hallazgos de Reliability que quedan pendientes.
```

```
¿Deberíamos aprobar este PR para producción, o faltan condiciones por resolver?
```

---

## 5. Advisory Mode — dudas puntuales de diseño

Responde preguntas arquitectónicas con trade-offs, sin dogma.

```
¿Cuáles son los trade-offs entre EF Core y Dapper para este caso de uso?
```

```
¿Es necesario un Outbox Pattern aquí, o es sobreingeniería para este volumen de mensajes?
```

```
¿Por qué CancellationToken.None sería válido en este método de limpieza, en lugar de propagar el token?
```

---

## Secuencia sugerida sobre un proyecto ya en revisión

Si ya tienes hallazgos identificados (por ejemplo, de SonarQube), el orden recomendado es:

1. **Review Mode** — confirma que el asistente detecta los mismos hallazgos, referenciados con el mismo rule ID de la EAF.
2. **Build Mode** — pide la corrección puntual de cada hallazgo.
3. **Scorecard Mode** — mide el impacto comparando antes/después.
4. **Assessment Mode** — cuando quieras la decisión GO/NO GO final.

**Advisory Mode** se usa ad hoc, en cualquier punto del ciclo, cuando surja una duda de diseño.
