<script lang="ts">
  import TopAppBar, { Row, Section, Title } from "@smui/top-app-bar";
  import IconButton from "@smui/icon-button";
  import { onMount } from "svelte";

  let canvas;
  let ctx;

  const snowflakes = [];
  const color = "#ADD8E6";
  const maxSnowflakes = 500;
  const updateInterval = 50;

  onMount(() => {
    ctx = canvas.getContext("2d");
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    function createSnowflakes() {
      while (snowflakes.length < maxSnowflakes) {
        const size = Math.random() * 5 + 2;
        const x = Math.random() * window.innerWidth;
        const y = -size;
        snowflakes.push({ x, y, size });
      }
    }

    function drawSnowflakes() {
      ctx.clearRect(0, 0, canvas.width, canvas.height);
      ctx.fillStyle = color;

      snowflakes.forEach((flake) => {
        ctx.fillRect(flake.x, flake.y, flake.size, flake.size);
      });
    }

    function updateSnowflakes() {
      snowflakes.forEach((flake) => {
        flake.y += flake.size * 0.5;
        flake.x += (Math.random() - 0.5) * 2;

        if (flake.y > window.innerHeight) {
          flake.y = -flake.size;
          flake.x = Math.random() * window.innerWidth;
        }
      });
    }

    function loop() {
      updateSnowflakes();
      drawSnowflakes();
      setTimeout(loop, updateInterval);
    }

    createSnowflakes();
    loop();

    window.onresize = () => {
      canvas.width = window.innerWidth;
      canvas.height = window.innerHeight;
    };
  });
</script>

<link
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
  rel="stylesheet"
/>

<main>
  <TopAppBar>
    <Row>
      <Section align="start">
        <img src="/logo-w.svg" alt="Logo" class="logo" />
      </Section>
      <Section align="end" shrinkToFit>
        <a href="https://github.com/ZeroDAO" target="_blank">
          <IconButton
            class="fa-brands fa-github colored-icon-button material-icons"
          /></a
        >
        <a href="https://medium.com/@melodot" target="_blank">
          <IconButton
            class="fa-brands fa-medium colored-icon-button material-icons"
          /></a
        >
        <a href="https://docs.melodot.io/" target="_blank"
          ><IconButton
            class="fas fa-file colored-icon-button material-icons"
          /></a
        >
        <a class="big-link"
          href="https://zerodao.notion.site/Melodot-Data-Availability-Layer-Whitepaper-b72b1f3de81c40fc94a56763756ce34a?pvs=4"
          target="_blank"
          ><IconButton
            class="fas colored-icon-button material-icons"
            >Whitepaper</IconButton
          ></a
        >
      </Section>
    </Row>
  </TopAppBar>

  <div class="content">
    <h1>One Block, One Movie</h1>
    <p class="sub-title">GB-level Data Availability Layer</p>
  </div>

  <canvas bind:this={canvas} id="snowCanvas" />
</main>

<style>
  main {
    text-align: center;
    padding: 1em;
    max-width: 240px;
    margin: 0 auto;
  }

  canvas {
    position: fixed;
    top: 0;
    left: 0;
    z-index: -1;
  }

  h1 {
    color: #e4007f;
    font-size: 4em;
    font-weight: bold;
  }

  :global(.colored-icon-button.material-icons) {
    transition: transform 0.3s ease, color 0.3s ease;
  }

  :global(.colored-icon-button.material-icons:hover) {
    color: #e4007f;
    transform: scale(1.1);
    cursor: pointer;
  }

  .logo {
    margin-top: 5rem;
    margin-bottom: 1rem;
    height: 58px;
  }

  .sub-title {
    color: #ece9eb;
    font-size: 1.5em;
    font-weight: bold;
  }

  .content {
    text-align: center;
    margin-top: 2rem;
    padding-top: 64px;
  }

  .big-link {
    font-size: 1rem;
  }

  @media (min-width: 640px) {
    main {
      max-width: none;
    }
  }
</style>
