shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture;
uniform float noise_opacity : hint_range(0.0, 1.0);
uniform float noise_speed : hint_range(0.0, 10.0) = 1.0;

float random(vec2 uv) {
    return fract(sin(dot(uv.xy,
        vec2(12.9898,78.233))) * 43758.5453123);
}

vec4 overlay(vec4 base, vec4 blend){
	vec4 limit = step(0.5, base);
	return mix(2.0 * base * blend, 1.0 - 2.0 * (1.0 - base) * (1.0 - blend), limit);
}


void fragment() {
	
	vec4 bg = texture(screen_texture, SCREEN_UV);
	
	vec2 animated_uv = UV + vec2(TIME * noise_speed);
	
	vec4 noise = vec4(random(animated_uv*0.1), random(animated_uv), random(animated_uv*0.2), 1);
	
	vec4 overlay_color = overlay(bg, noise);
	
	COLOR = mix(bg, overlay_color, noise_opacity);

}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
