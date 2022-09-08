# Añadiendo contenido a una página HTML

[Previamente](./1-crear-html.md), viste como crear la estructura de una página HTML. Ahora es el momento de añadir más contenido a tu currículum. Probablemente te gustaría adicionar una dirección de correo electrónico, links a tus redes sociales, tu educación y tu experiencia laboral.

## Actualiza el Header

Muchos currículums destacan el nombre de la persona en la parte superior como el "título" del currículum. Este es el lugar perfecto para usar un tag `h1`. También puedes añadir una pequeña separación entre el header y el resto de a página usando dos líneas horizontales, o unos tags `hr`, con algo de texto en el medio.

1. Dentro del **index.html**, cambia el texto "TU NOMBRE" por tu nombre. Cambia "TU PUESTO" por el puesto que ocupas - o el títuo que quisieras tener - por ejemplo "INGENIERO EN SOFTWARE.

    > **NOTA** Si quieres que tu currículum se vea como el ejemplo en el que estamos trabajando, sigue los ejemplos de la plantilla del HTML. Por ejemplo, reemplaza **TU PUESTO** con "ESTUDIANTE EN INGENIERÍA DE SOFTWARE", usando letras mayúsculas. Una vez que añadas estilos con CSS a tu currículum, puedes experimentar personalizandolo.

## Creando links para las redes sociales y tu correo electrónico

Creemos un link para tu correo electrónico y cualquier red social que quieras compartir. Usarás el tag `a`, que es la abreviación para "anchor". `a` tiene un atributo llamado `href` (abreviación de "hypertext reference"). `href` contendrá el link al que quieras ser redirigido. Cuando el usuario presione el link, lo enviará a la página corrspondiente. Si quieres redirigir a un correo electrónico, deberás usar `mailto:` por delante del correo; esto abrirá el cliente de correo electrónico del usuario.

1. Dentro de **index.html**, y debajo del comentario que dice `<!-- Información de contacto, incluyendo tus redes sociales -->`, añade el siguiente HTML para redireccionar a tu correo, reemplazando **tu-email@ejemplo.com** con el tuyo:

    ```html
    <p>
        <i class="fa fa-envelope" aria-hidden="true"></i>
        <a href="mailto:tu-email@ejemplo.com.com">tu-email@ejemplo.com</a>
    </p>
    ```

1. La página automáticamente se actualizará con tu correo electrónico.

    > **NOTA** Fíjate que hay un tag `i` aquí - este eventualmente contendrá un pequeño ícono de sobre. Ahora mismo, solo muestra un cuadrado, y eso es porque necesitas añadir una fuente de ícono a tu página. No te preocupes por esto - haremos eso en el siguiente paso, y mágicamente ese cuadrado se convertirá en un sobre.

1. Repite esto para cada red social que quieras añadir. Aquí hay algunos íconos que puedes usar para varias redes sociales. Cambia la `class (clase)` de `i` con cualquiera de los siguientes valores.

    * fab fa-twitter
    * fab fa-linkedin
    * fab fa-github
    * fab fa-facebook

1. Similar a eso, cambia `href` de cada elemento `a` con el hipervínculo apropiado de cada red social, y asegúrate de cambiar el texto de cada link también. Por ejemplo, si quieres añadir el link a GitHub o LinkedIn a tu currículum, el HTML se debería ver como este: 

    ```html
    <p>
        <i class="fab fa-github" aria-hidden="true"></i>
        <a href="github.com/gh-username">gh-username</a>
    </p>
    <p>
        <i class="fab fa-linkedin" aria-hidden="true"></i>
        <a href="linkedin.com/linkedin-username">linkedin-username</a>
    </p>
    ```

> **IMPORTANTE** donde sea que pongas un link a la página que quieras, asegúrate de mostrar el texto correspondiente (comunmente referido como texto del vínculo) describa con precisión dónde lleva el link. Textos como **aquí** o **click aquí** no son accesibles ya que no permiten entender el propósito del link. Usar [bien el texto del vínculo hace tus páginas accesibles](https://docs.microsoft.com/learn/modules/web-development-101-accessibility/4-links-images?WT.mc_id=academic-51109-ornella) para todos.

## Creando listas

Las listas vienen en dos variedades en HTML: ordenadas (con números o letras) y desordenadas (puntos). `ol` es usada para crear listas ordenadas y `ul` es usado para crear listas desordenadas. `li` indica cada "elemento" de la lista. Usemos una lista desordenada para crear el listado de nuestra experiencia laboral.

Puedes añadir cuantos puntos de experiencia laboral que quieras, modificando el texto de forma apropiada. 

1. Dentro de **index.html**, debajo del comentario que dice `<!-- tu experiencia laboral -->`, añade el siguiente HTML para crear una lista:

    ```html
    <h3>JOB TITLE</h3>
    <p>
			Nombre de la compañía | 2008 - 2010
    </p>
    <p>
			Describe que hacías en esta posición con una oración de resumen y no más de 3 puntos de aspectos destacados.
    </p>
    <ul>
			<li>Logro genial</li>
			<li>Logro genial</li>
			<li>Logro genial</li>
    </ul>
    ```

1. Cambia TU POSICIÓN con tu actual posicón de trabajo (por ejemplo, INGENIERO DE SOFTWARE).

1. Cambia el "Nombre de la compañía" por el que corresponda.

1. Añade una pequeña descripción que resuma tus responsabilidades.

1. Actualiza el elemento `li` para añadir tus logros destacados de tu experiencia laboral.

## Terminando nuestro currículum

Terminemos llenando las secciones finales de tu currículum...

1. Dentro de **index.html**, debajo del comentario que dice `<!-- tus habilidades -->`, añadiendo el siguiente HTML e incluyendo las habilidades que tú tienes. 

	```html
	    <p>HTML, CSS, GitHub, VS Code...</p>
	```

1. Debajo del comentario que dice `<!-- tu educación -->`, añade el siguiente HTML para la información sobre tu educación y actualiza con el texto correspondiente:

    ```html
    <h3>TU ESPECIALIDAD</h3>
		<p>
			Tu universidad o escuela
		</p>
		<p>
			2018-2022
		</p>
    ```

1. Debajo del comentario que dice `<!-- sobre tí -->`, añade el siguiente HTML y actualizalo con una breve descripción de quien eres y para que clase de compañía quieres trabajar:

    ```html
    <p>Un breve párrafo sobre que clase de compañía o trabajo buscas.</p>
    ```

1. La ventana se actualizará con tu nueva información.

## Resumen y siguiente paso

¡Añadiste la información para tu currículum! También exploraste algunos de los tags más comunes de HTML. Pero notarás que la página desplegada se ve algo plana. Veamos como podemos usar [CSS para estilizar la página](./3-anadir-estilo.md).