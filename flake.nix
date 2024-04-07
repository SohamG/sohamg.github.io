{
  description = "Website Flake";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "nixpkgs";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = import nixpkgs { inherit system; }; in
        {
          devShells.default = pkgs.mkShell {
					  name="Guile FCGI Website";
						packages=with pkgs;[guile fcgi pkg-config autoconf automake];
            FCGI=pkgs.fcgi;
        	};
				});
} 
