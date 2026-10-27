# IOBee

Sistema de monitoreo mecatrónico para colmenas Langstroth que mide **peso, temperatura y humedad** y muestra en una aplicación móvil cuánta miel lleva producida la colmena, para que el apicultor sepa cuándo acercarse a cosechar sin abrirla.

Proyecto integrador de la carrera de Ingeniería en Mecatrónica, Escuela Superior Politécnica del Litoral (ESPOL), Guayaquil, 2021.
Autores: Leonardo Ortiz y Gustavo Sabando.

- Documento completo: [Diseño de un sistema de monitoreo mecatrónico para la determinación de tiempos de cosecha de la miel en tiempo real (PDF)](Dise%C3%B1o%20de%20un%20sistema%20de%20monitoreo%20mecatr%C3%B3nico%20para%20la%20determinaci%C3%B3n%20de%20tiempos%20de%20cosecha%20de%20la%20miel%20en%20tiempo%20real.pdf)
- Video de la app en un emulador Android: archivo `.mp4` en la raíz del repositorio.

## El problema

En Ecuador hay un buen ecosistema para la apicultura, pero la falta de monitoreo de las colmenas en los tiempos de recolección dificulta producir miel de calidad. El apicultor suele depender de abrir la colmena para revisar, lo que perturba a las abejas.

## La solución

Un marco con sensores que se coloca bajo las cajas de producción de una colmena Langstroth, y una app que muestra los datos de forma remota.

| Parte | Qué se usó |
|---|---|
| Estructura | Marco impreso en 3D en PLA, con ranuras para sensores y rieles para el cableado. Se analizó en Autodesk Inventor. |
| Peso | 4 celdas de carga de 50 kg y módulo HX711 |
| Temperatura y humedad | Sensor DHT22 |
| Procesamiento | Arduino Nano |
| Comunicación | Módulo LoRa SX1272 hacia un gateway LoRa |
| Nube | Firebase (Firestore), colección `datos` con un documento por lectura (fecha y hora como identificador) |
| Energía | Batería de 12 V y 65 Ah con regulador LM2596 |
| App móvil | Flutter / Dart |

### Cómo decide cuándo cosechar

La app usa la regla de Farrar como referencia: el cuadrado del peso de las abejas de la colmena equivale al peso de miel producida. Para una colmena Langstroth, con capacidad de unas 45 000 abejas, el modelo da un máximo de **14 litros de miel por temporada**. La app muestra el avance hacia ese máximo y el historial de peso por día.

## Resultados de la prueba de concepto

- Se construyó un prototipo del marco con sensores y se calibraron las celdas de carga con un peso conocido de 6,25 kg. La lectura quedó estable con una resolución de ±0,01.
- La conectividad se probó **simulando** el gateway LoRa: un script en Python lee el puerto serial del prototipo (puertos virtuales) y sube los datos a Firestore con `firebase-admin`. El enlace de radio LoRa real no fue parte de esa prueba.
- La app mostró los cambios de los datos de la colmena y el avance hacia el máximo de miel.
- Costo del prototipo, incluido el gateway: USD 297,79. Con una colmena de 14 litros por temporada, dos temporadas al año y USD 10 por litro, el proyecto estima recuperar la inversión en aproximadamente un año. Un gateway admite hasta 30 nodos.

## Qué contiene este repositorio

| Ruta | Contenido |
|---|---|
| `IOBee/` | Código de la app móvil en Flutter (ver más abajo) |
| `IOBeeProto/` | Versión anterior (prototipo inicial) de la app |
| PDF y video | Documento del proyecto integrador y demostración en emulador |

No incluye el firmware del Arduino ni el script del gateway en Python.

### Estado de la app en este repositorio

El código publicado en `IOBee/` es una **versión temprana de la interfaz**, no la app completa que se muestra en el documento. Hoy contiene:

- Navegación con tres pestañas: Home, Estado e Histórico.
- Histórico: ya se conecta a la colección `datos` de Firestore y filtra por mes, pero el gráfico de peso (`charts_flutter`) y el peso actual todavía usan **valores de ejemplo** (aleatorios y fijos).
- Estado: lista de peso, temperatura y humedad con **valores de ejemplo fijos**.
- Home: pantalla provisional.

El inicio de sesión con Google, el modelo 3D de la colmena, las ruedas de progreso (miel, temperatura, humedad, batería) y la lectura de los datos reales en pantalla, que aparecen en el documento, no están en este código.

### Ejecutar la app

La app está escrita para el Flutter de la época (Dart `>=2.1.0 <3.0.0` y la API antigua `Firestore.instance`), por lo que con versiones actuales de Flutter requiere migración. Necesita un proyecto de Firebase propio con su `google-services.json`.

## Trabajo futuro (según el documento)

- Conectar varias colmenas a un mismo gateway y a una misma app.
- Usuarios distintos por sistema en la base de datos.
- Panel solar como fuente de energía y diseños de marco más económicos.
- Con años de datos, algoritmos predictivos para anticipar el momento ideal de cosecha.
