# IOBee (app móvil)

App en Flutter del sistema de monitoreo de colmenas IOBee: muestra peso, temperatura y humedad de la colmena y el historial de peso, con datos guardados en Firestore.

Para el contexto del proyecto, el hardware y los resultados, ver el [README principal](../README.md).

Esta carpeta contiene una versión temprana de la interfaz: algunas pantallas todavía usan valores de ejemplo. El detalle está en la sección "Estado de la app" del README principal.

## Estructura

- `lib/main.dart`: navegación entre pestañas.
- `lib/Pages/`: pantallas Home, Estado e Histórico.
- `lib/graph_widget.dart` y `lib/month_widget.dart`: gráfico y resumen del historial.
