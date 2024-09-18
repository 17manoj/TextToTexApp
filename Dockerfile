# Use official python 3.9 image
FROM python:3.9

# Set working directory to /code
WORKDIR /code

# Copy the current 
COPY ./requirements.txt /code/requirements.txt

# install the requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# set up a user name "user"
RUN useradd user

# Switch to the "user" user
USER user

# Set home to the user's home directory

ENV HOME=/home/user \
    PATH=/home/user/.local/bin:$PATH

# set the working directory to teh user's home directory
WORKDIR $HOME/app

# Copy the current directory contents into the container at $HOME/app setting the owner to 
COPY --chown=user . $HOME/app

#  Start the FASTAPI App on port 7860
CMD ["uvicorn", "app:app","--host","0.0.0.0","--port","7860"]
