{
  enable = true;

  config = {
    hwdec   = "auto";
    profile = "high-quality";
    vo      = "gpu-next";

    keep-open             = "yes";
    save-position-on-quit = "yes";

    slang    = "en";
    sub-auto = "fuzzy";
  };

  profiles = {
    loop = {
      loop-file    = "inf";
      profile-cond = ''( filename:match"%.webm$" or filename:match"%.mp4$" ) and p["duration"]<30'';
    };
  };
}
