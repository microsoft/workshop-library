# Crear una página web con HTML

HTML es el acrónimo para Hypertext Markup Language (lenguaje de marcado de hipertexto), y es usado para "etiquetar" el texto que será desplegado en una página web. Específicamente HTML es usado para describir la jerarquía y función del texto en una página. Con HTML podrás indicar un Header, crear conexión a otra página, o indicar dónde debería estar una imagen.

HTML se basa en lo que llamamos "tags" o "elementos". Aunque existe una diferencia técnica entre ambos, encontrarás desarrolladores que usan estos términos indistintamente y generalmente esto no afectará en cómo crees tu código. El navegador lee estos tags y determina como mostrar e interpretar la información de una página.

Comenzarás construyendo tu currículum creando un archivo HTML y añadiendo código. Notarás que que la página no parecerá estar estructurada o robusta; se verá mejor cuando añadas algunos estilos.

## Creando un archivo HTML con CodeSwing

Usarás CodeSwing para crear tus archivos HTML y CSS en Visual Studio Code. CodeSwing tiene una variedad de plantillas que podrás usar y también incluye ayuda para páginas web avanzadas. Comienza creando tu primer "swing" usando la plantilla madre de HTML.

1. Abre **Command Palette** seleccionando el ícono de las tres líneas paralelas al lado izquierdo de tu Barra de herramientas, luego dirígete a **View > Command Palette**. También puedes abrirlo rápidamente usando el comando **Control+Shift+P** en una PC, o **Command+Shift+P** en una Mac.
1. Escribe **CodeSwing**, y luego selecciona **CodeSwing: Initialize Workspace as Swing**.
1. Selecciona la opción **Basic: HTML-Only** y tu nuevo swing aparecerá, con tu archivo HTML a la izquierda y tu navegador a la derecha.
1. Esto creará un archivo **index.html** en tu directorio.

> **IMPORTANTE** Si accidentalmente cierras la pestaña incorrecta, puedes volver a abrir CodeSwing navegando en tu repositorio en github.dev, abriel el Command Palette con **Control+Shift+P** (o **Command+Shift+P** en Mac), escribiendo **CodeSwing**, seleccionando **CodeSwing: Open Swing...**, y seleccionando el directorio con tus archivos.

¡Ahora tienes tu archivo HTML creado para la página de tu currículum!

## Creando la estructura del HTML

Comencemos agregando el HTML de nuestra página. Cualquier oágina HTML incluye tres principales tags - `html` que contiene todo el HTML, `head` que inlcuye la información sobre la página, y `body` que contiene el contenido que se desplegará en la página. Los tags también incluyen **atributos**, que nos permiten cambiar el comportamiento de un tag. Los atributos son pares clave/valor como: `rel="stylesheet"`.

> **Nota:** Te darás cuenta que algunos nombres están algo cifrados o no son necesariamente intuitivos. Esto se debe en parte a la historia de HTML. HTML originalmente era usado por científicos y académicos como una manera de estructurar documentos. Como resultado, los nombres o abreviaciones pueden no estar siempre claros como lo esperamos.

La mayoría de los tags tienen una apertura (`<tag>`) y un cierre (`</tag>`), y contienen información. Así es como `<title>Demo title</title>` indica el título de la página. Otros tags unicamente poseen un tag único, por ejemplo `<link rel="stylesheet" href="style.css">`. Estos tags se comportan generalmente como un comando, diciendole al navegador que debe realizar cierta tarea.

> **Tip:** No intentes memorizar cada tag disponible. Al igual que memorizar un diccionario no es la mejor manera de aprender un idioma, memorizar las palabras clave no te ayudarán en tu proceso como desarrollador. A medida que aprendas a crear páginas, aprenderás también sobre más tags y cómo funcionan.

Usarás estos tres tags (y algunos otros más) para comenzar con la creación de tu currículum. Te explicaremos cada tag al finalizar la creación de la página.

1. Dentro de la pestaña **index.html**, añade el siguiente código para crear la estructura inicial de tu página web, reemplazando **Tu Nombre** en el tag del título `<title>` con tu nombre:

    ```html
	<html>
		<head>
			<link href="style.css" rel="stylesheet">
			<title>Tu Nombre currículum</title>
		</head>

		<body>
			<header id="header">
				<!-- Header de tu currículum con tu nombre y puesto -->
				<h1>TU NOMBRE</h1>
				<hr>
				TU PUESTO (EJ: ESTUDIANTE DE INGENIERÍA EN SOFTWARE)
				<hr>
			</header>
			<main>
				<article id="mainLeft">
					<section>
						<h2>CONTACTO</h2>
						<!-- Información de contacto, incluyendo tus redes sociales -->
					</section>
					<section>
						<h2>HABILIDADES</h2>
						<!-- tus habilidades -->
					</section>
					<section>
						<h2>EDUCACIÓN</h2>
						<!-- tu educación -->
					</section>            
				</article>
				<article id="mainRight">
					<section>
						<h2>SOBRE MÍ</h2>
						<!-- sobre tí -->
					</section>
					<section>
						<h2>EXPERIENCIA LABORAL</h2>
						<!-- tu experiencia laboral -->
					</section>
				</article>
			</main>
		</body>
	</html>
    ```

1. Fíjate que mientras escribes (o copias y pegas) la pestaña de tu navegador, en la parte derecha, automáticamente se actualizará con la información que vayas añadiendo.

### Explorando el código

Usaste varios tags para desplegar tu nueva página. Debajo encontrás una tabla que describe cada uno de los tags y para que son usados. Mientras miras el código, date cuenta que el HTML está cescrito con letras minúsculas, y que usaste espacios (tabs) para crear un esquema para el código. Aunque esos espacios no son necesarios, hacen que el HTML sea mucho más legible.

| tag                          | descripción                                                                                                                                                                                                      |
| ---------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `html`                       | Contenedor de todo el HTML en una página HTML.                                                                                                                                                                          |
| `head`                       | Contiene metadata, o información sobre la página.                                                                                                                                                              |
| `link`                       | Usado para decirle a la página qué hoja de estilos de CSS usar. `rel="stylesheet"` indica que estamos usando una hoja de estilos, y `href="style.css"` carga un **style.css** (el cual es el nombre de la hoja de estilos que crearemos en la sección de CSS de este taller). |
| `title`                      | Indica el nombre de la página que será mostrado en la barra de herramientas. Esto **no** será mostrado en la página como tal. Toda página que vayas a crear debería tener un título.                                                              |
| `body`                       | Es el contenido de la página que será mostrado al usuario.                                                                                                                                                            |
| `header`, `main`, `article`, `section` | Estos son tags "semánticos". Para más información, revisa la descripción debajo.                                                                                                                                              |
| `h1`                         | Header de nivel 1. los tags para los headers van desde `h1` a `h6`, siendo `h1` el nivel más alto, y `h6` siendo el nivel más bajo. Son usados para crear un esquema para la página. |
| `p` | Un tag de párrafo. Los tags para párrafos son donde estará el cuerpo del texto de tu página .
| `hr` | Crea una línea horizontal. Es un acrónimo de "horizontal rule".
| `id` | `id` es un atributo que te permite asignar un único id para un elemento de HTML. Lo usaremos cuando agreguemos estilos al HTML. 
| `<!-- comment -->` | Son comentarios en HTML. Son muy útiles para hacer notas o agregar recordatorios para tí mismo.

> **Nota:** Los comentarios son una buena forma de hacer notas mientras aprender HTML. Puedes agregar uno justo debajo de un fragmento de código, y describir de que se encarga dicha sección. Pero recuerda que los comentarios **no están** ocultos para los navegadores, así que evita información sensible en los comentarios ya que cualquier persona que vea el código fuente podrá leerlos.

#### Tags semánticos

Los tags semánticos son relativamente nuevos en HTML. Notarás que hay uan diferencia de tamaño entre `h1` y `h2`. Esto es porque, aparte de indcar un nivel, los tags "header" indican como será mostrado el contenido. Los tags semánticos, como `header`, `main`, `article` y `section` son usados únicamente para agrupar la información. Son útiles para estruscturar un documento HTML largo, y luego usar CSS para controlar como el contenido será finalmente desplegado.

Puedes usar los tags semánticos como gustes, pero una jerarquía común sería:

- `header`
- `main`
    - `article`
        - `section`

> **Nota:** Los tags semánticos son también muy útiles para hacer tus páginas web "accesibles", o más fáciles de leer para los lectores de pantalla así, todos los usuarios, incluyedo los que tienen discapacidades, podrán acceder a tus páginas web. Infórmate más acerca de hacer las páginas más accesibles [en este artículo](https://developer.mozilla.org/docs/Learn/Accessibility/HTML).

## Resumen y siguiente paso


¡Acabas de crear tu primera página HTML! Como siguiente paso, [añadiremos contenido adicional](./2-anadir-contenido.md) como tu email y secciones para tu experiencia laboral.
