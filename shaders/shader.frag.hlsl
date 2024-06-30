struct PS_Input {
    float4 position : SV_POSITION;
    float4 color : COLOR0;
};

struct PS_Output {
    float4 fragColor : SV_TARGET0;
};


PS_Output main(PS_Input input) {
    float4 outFragColor = input.color;

    PS_Output output;
    output.fragColor = outFragColor;

    return output;
}
