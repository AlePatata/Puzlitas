shader_type canvas_item;

uniform sampler2D screen_texture:hint_screen_texture,repeat_disable,filter_nearest;
uniform sampler2D noise_texture:repeat_enable;
uniform float health : hint_range(0.0, 1.0);

void fragment() {
	vec3 noise_color = texture(noise_texture,SCREEN_UV + (TIME / (health*100.0 + 50.0))).rgb; // velocidad
	vec3 color = texture(screen_texture,SCREEN_UV + (noise_color.r / (health*100.0 + 50.0))).rgb; // forma
	float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));
	vec3 grayscale = vec3(gray);
	color.rgb = mix(grayscale, color.rgb, health);
	COLOR.rgb = color;
}
