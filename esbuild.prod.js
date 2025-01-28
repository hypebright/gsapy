import esbuild from "esbuild";
import {sassPlugin} from 'esbuild-sass-plugin';
import postcss from 'postcss';
import autoprefixer from 'autoprefixer';

esbuild
  .build({
    entryPoints: ['./srcjs/main.js'],
    outdir: "inst/gsapy-0.0.0.9000/dist",
    entryNames: "gsapy.min",
    bundle: true,
    format: "esm",
    minify: true, // prod
    sourcemap: "external", // prod
    plugins: [
      sassPlugin({
        async transform(source) {
          const { css } = await postcss([autoprefixer]).process(source);
          return css;
        },
      }),
    ]
  })
  .then(() => console.log("⚡ Build complete! ⚡"))
  .catch(() => process.exit(1));
