<script setup lang="ts">
import { ref, onMounted } from "vue";
import Vivus from "vivus";
import gsap from "gsap";

const svgObjectRef = ref<any>(null);
const h1Ref = ref<any>(null);

onMounted(() => {
	// insure that the svg has loaded
	svgObjectRef.value.onload = () => {
		// create a timer so that the animation doesnt start instantly
		setTimeout(() => {
			// set up the vivus animation with the correct options
			const logo = new Vivus(
				svgObjectRef.value,
				{
					type: "oneByOne",
					duration: 400,
					animTimingFunction: Vivus.EASE,
					start: "manual",
				},
				() => {
					// callback for when the animation finishes
					// gsap coming soon
					gsap.to(h1Ref.value, {
						duration: 1,
						opacity: 1,
					});
				}
			);

			// set the opacity to one, starts at zero so that theres no pop in
			svgObjectRef.value.style.opacity = 1;
			// play animation
			logo.play();
		}, 800);
	};
});
</script>

<template>
	<div>
		<object
			ref="svgObjectRef"
			data="/pklwrks-light-tighter.svg"
			type="image/svg+xml"
		></object>
		<h1 ref="h1Ref">coming soon</h1>
	</div>
</template>

<style scoped>
div {
	height: 100vh;
	width: 100vw;

	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	gap: 16px;
}

object {
	height: auto;
	max-width: clamp(100px, 30vw, 300px);

	opacity: 0;
}

h1 {
	color: white;
	font-size: clamp(1.5rem, 5vw, 3rem);

	opacity: 0;
}
</style>
