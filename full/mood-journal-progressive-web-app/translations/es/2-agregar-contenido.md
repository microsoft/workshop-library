[⏮️ Ir al paso anterior](./1-crear-pwa.md)

[⏭️ Ir al siguiente paso](./3-despliegue-en-Azure.md)

# Agregar contenido a tu PWA

En este paso actualizaremos los archivos de origen de la solución generada para agregar funcionalidades esenciales como el seguimiento de estado de ánimo y el diario.

> Nota: El objetivo de este taller no es enseñar desarrollo web. Este paso es completamente opcional. Puede omitir este paso si tienes otras funcionalidades en mente. O puede descargar la solución completa desde [esta carpeta - solution/02-repose](../../solution/02-repose/) y pasar al siguiente paso inmediatamente.

Asegúrate de que la solución se esté ejecutando con este comando `npm run dev`. De esta manera, cuando guardes tus cambios, podrás verlos reflejados en el navegador. Siempre puedes detener el servidor presionando la combinación de teclas `ctrl + c`.

## Estructura de la solución

### `index.html`

Primero, echa un vistazo al punto de entrada de tu aplicación, el archivo `index.html`. Este es el archivo donde describes la estructura de tu sitio. El proyecto generado apunta a `app-index.ts` en la carpeta `src`, donde se configuran las rutas y se importan todos los componentes y páginas. También incluye metadatos como el título y la descripción de tu aplicación. Hagamos algunos cambios:

1. Actualiza el campo de título con `<title>Repose</title>`.
2. Actualiza el campo de metadatos de descripción con `<meta name="description" content="Esta es una aplicación de diario de salud mental" />`

### `app-home.ts` en la carpeta `src/script/pages`

Esta es la página de inicio de Repose. ¿Cómo sabe el navegador que debe renderizarla al ver `index.html`? Porque `index.html` apunta a `app-index.ts` agregándolo en la etiqueta `<body>`, y `app-index.ts` determina que la ruta predeterminada `/` usa la página `app-home.ts` cuando la aplicación se actualiza por primera vez a través del evento de ciclo de vida `firstUpdated()` en lit.

Ahora, agreguemos una sección de héroe - la primera cosa que ven las personas cuando visitan la página de inicio de Repose.

1. En la función `render()`, después de `<app-header></app-header>`, agrega lo siguiente:

```html
  <div class="hero">
    <hero-decor></hero-decor>
    <div class="hero__inner">
      <div class="hero__top-content">
        <h1>Diario inteligente de estado de ánimo</h1>
        <p>Repose es tu compañero personal de seguimiento de estado de ánimo que te ayuda a organizar y reflexionar sobre tus pensamientos diarios.</p>
        <fluent-anchor href="/journal" appearance="lightweight">Registro de estado de ánimo</fluent-anchor>
      </div>
      <div class="hero__bottom-content">
      <img src="assets/media/humans.svg" alt="Humanos">
      </div>
    </div>
  </div>
```

2. En la función `static get styles()`, elimina todos los estilos css de la declaración `return`. Agrega los siguientes estilos:

```css
  .hero {
    height: 90vh;
    min-height: 600px;
    max-height: 900px;
    max-width: 100%;
    max-width: 100vw;
    padding: 0 48px;
    overflow-x: hidden;
    position: relative;
  }

  .hero__inner {
    display: flex;
    flex-direction: column;
    position: relative;
    max-width: 800px;
    margin-left: auto;
    margin-right: auto;
  }

  .hero__top-content {
    flex: 1 1 0px;
    color: white;
    margin: 4rem 5rem 0;
    text-align: center;
    max-height: 25vh;
  }

  .hero__top-content h1 {
    font-weight: normal;
    font-size: 48px;
  }

  .hero__top-content fluent-anchor {
    margin-top: 1rem;
  }

  .hero__top-content fluent-anchor::part(control) {
    border-radius: 15px;
    color: #107652;
  }

  .hero__top-content fluent-anchor::part(control):hover {
    color: #2E765E;
  }

  .hero__bottom-content {
    flex: 1 1 0px;
    height: 50vh;
  }

  .hero__bottom-content img {
    width: 100%;
    height: 100%;
  }

  @media screen and (max-width: 840px) and (min-width: 625px) {
    .hero__top-content {
      margin: 4rem 2rem 0px;
    }
  }

  @media screen and (max-width: 625px) and (min-width: 480px) {
    .hero__top-content {
      margin: 2rem 2rem 0px;
    }

    .hero__bottom-content {
      margin-top: 7rem;
    }
  }

  @media screen and (max-width: 480px) {
    header {
      margin: 0 2rem;
    }

    .hero {
      padding: 0 1rem;
    }

    .hero__top-content {
      margin: 1rem 0;
    }

    .hero__top-content h1 {
      font-size: 36px;
    }

    .hero__bottom-content {
      margin-top: 7rem;
    }
  }
```

## Crear un nuevo componente reutilizable

Siempre que necesites agregar un nuevo componente reutilizable a tu aplicación, debes agregarlo a la carpeta `src/script/components`. Los componentes reutilizables comunes son: encabezado, navegación y pie de página. En Repose, agregaremos un nuevo componente reutilizable llamado `hero-decor`. Esta es la imagen del héroe que se mostrará como fondo en la página de inicio y en la página del diario.

1. Crea un componente decorativo de héroe llamado `hero-decor.ts` en la carpeta `./src/script/components/` que se renderice como fondo de la sección del héroe. Importa este componente en el archivo `app-index.ts` con `import './script/components/hero-decor';` en la línea 8 después de la importación del componente de encabezado. Y copia el código de [este archivo hero-decor](../../solution/02-repose/src/script/components/hero-decor.ts) a él. Puedes usar tu propia imagen o diseño y agregar CSS para modificarlo a tu manera.

## Copiar archivos de recursos, estilos y otros

Nuevamente, estamos copiando estos archivos en lugar de entrar en detalles del código porque queremos mantener el taller enfocado en las funciones principales de PWA. En cualquier momento de este paso, siéntase libre de descargar la solución completa desde [esta carpeta - solution/02-repose](../../solution/02-repose/) y pasar al siguiente paso inmediatamente.

### Agregar carpeta creativas

1. Agregar la [carpeta de medios (media folder)](../../solution/02-repose/public/assets/media/) que contiene dos creativas a la carpeta `./public/assets`. Estas son imágenes de fondo para Repose.

### Actualizar estilos globales

1. Reemplaza el archivo `global.css` en la carpeta `./src/styles/` con los estilos de [este archivo](../../solution/02-repose/src/styles/global.css).
2. Elimina los estilos no deseados de los archivos generados, como en `./src/script/app-index.ts`, elimina `padding-left: 16px;` y `padding-right: 16px;` del elemento `main`.

### Actualizar componente de encabezado

Justo como el componente decorativo del héroe, actualizarás el componente de encabezado para adaptarlo a las necesidades de Repose. Y se reutilizará en todas las páginas.

1. Reemplaza `header.ts` con el código de [este archivo](../../solution/02-repose/src/script/components/header.ts).
2. Actualiza `app-home.ts` para incluir la función "Ir atrás" como parte del componente `app-header`. Simplemente agrega el atributo `enableBack="${true}"` a él. Ahora el elemento `app-header` debería verse así: `<app-header enableBack="${true}"></app-header>`.

## Agregar o actualizar páginas de la aplicación

Puedes crear nuevas páginas para la aplicación y colocarlas en la carpeta `src/script/pages`. Estas páginas pueden usar los componentes reutilizables que creaste en el paso anterior. En Repose, no necesitarás una página de información. Entonces puedes actualizar el nombre del archivo `app-about.ts` a `app-journal.ts` y agregar funcionalidades de registro a él.

1. Cambia el nombre del archivo `app-about.ts` a `app-journal.ts`. También necesitarás actualizar esto en el archivo `app.index.ts` en la configuración del enrutador (`children` propiedad de `router.setRoutes`) como sigue:

```typescript
  {
    path: '/journal',
    component: 'app-journal',
    action: async () => {
      await import('./script/pages/app-journal.js');
    },
  },
```

Ahora, cuando hagas clic en el botón "Mood check-in", la aplicación Repose navegará a la página de registro sin contenido.

1. Agrega funcionalidad de registro a la página `app-journal.ts` con el código de [este archivo](../../solution/02-repose/src/script/pages/app-journal.ts).
2. Agrega este [archivo de interfaz](../../solution/02-repose/src/script/interfaces/journalEntry.ts) al proyecto.
3. Agrega este [archivo de utilidad](../../solution/02-repose/src/script/utils/journal.ts) al proyecto.
4. Agrega `localforage` a las dependencias de desarrollo del proyecto con este comando: `npm i localforage -D`.
5.  Ahora reinicia tu servidor de desarrollo con `npm run dev` y deberías ver la página de registro.

## *Funcionalidades adicionales

Si necesitas agregar funcionalidad para mostrar registros existentes, puedes echar un vistazo al [archivo `app-home.ts` completado](../../solution/02-repose/src/script/pages/app-home.ts) para obtener referencia. También puedes agregar un [componente de pie de página](../../solution/02-repose/src/script/components/footer.ts) a tu aplicación.

## Resumen y próximos pasos

Hagamos un breve resumen de lo que hiciste en este paso:
- Usted actualizó el archivo `index.html` para incluir el título y los metadatos para la aplicación Repose.
- Usted realizó un rediseño completo de la página de inicio, incluyendo algunos estilos CSS personalizados y creativos como imágenes de fondo.
- Usted creó un componente reutilizable llamado `hero-decor` que se renderiza como el fondo de la sección hero. Esto se usa en las páginas `app-index.ts` y `app-journal.ts`. También puedes usarlo en otras páginas a medida que las crees.
- Usted actualizó el componente de encabezado existente.
- Usted creó una nueva página llamada `app-journal.ts` que incluye la funcionalidad de registro.

Algo que debes considerar para los próximos pasos si estás construyendo una aplicación lista para producción: en lugar de usar `localforage`, que almacena las entradas de registro en el indexDB del almacenamiento de tu navegador local, debes considerar usar una solución de almacenamiento más persistente.

¡A continuación, hagamos que la aplicación Repose 👉🏼 [segura (paso 3)](./3-despliegue-en-Azure.md), [instalable (paso 4)](./4-agregar-manifiesto-web.md), [independiente de la red (paso 5) y funcione sin conexión (paso 5)](./5-registrar-trabajador-de-servicio.md)!

## Recursos
- [Módulo de Microsoft Learn: Construye un sitio web simple usando HTML, CSS y JavaScript](https://aka.ms/learn-pwa/workshop/docs.microsoft.com/learn/modules/build-simple-website/)
- [Taller: Construye un sitio web para mostrar tu currículum](https://aka.ms/learn-pwa/workshop/github.com/microsoft/workshop-library/tree/main/full/build-resume-website)
