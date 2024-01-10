# ComfyUI CI/CD pipeline

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/comfyui"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Deploy ComfyUI server with CI/CD on Elestio

<img src="comfyui.png" style='width: 100%;'/>
<br/>
<br/>

# Once deployed ...

You can open ComfyUI here:

    URL: https://[CI_CD_DOMAIN]
    login: admin
    password: [ADMIN_PASSWORD]

# Pulling a Model

To seamlessly pull a model for your project, follow these straightforward steps:

## Accessing the VM

- Navigate to the Tools tab.
- Click on the VS Code button to access your Virtual Machine (VM).

## Configuring the Model

- Once inside the VM, locate the default.sh file in the config > provisioning folder.
- Copy the download URL for the desired model. Ensure that the URL follows this format:

      https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors

- Paste the URL in the appropriate section within the default.sh file.

## Applying Changes

- Return to the 'Overviews' tab in Elestio.
- Click on the Restart button to implement the changes.

## Model Availability

With these steps completed, your model is now available for use in your project.

## Documentation

For more detailed information and some examples about the Comfyui and its features, please refer to the documentation available <a target="_blank" href="https://comfyanonymous.github.io/ComfyUI_examples/">here</a>.
