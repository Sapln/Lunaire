import os
import sys
from collections import deque

def escape(s):
    return str.replace(str.replace(str.replace(
        s
        , " ", "\\ ")
        , "'", "\\'")
        , "\"", "\\\""
    )

def gen_deque_files_from_path(path, ext):
    out = deque()
    
    files = os.listdir(path)

    for f in files:
        if not os.path.isdir(f):
            if f.split('.')[-1] == ext:
                out.append(f)
        else:
            others = gen_deque_files_from_path(path + "/" + f, ext)

            for i in others:
                out.append(f + "/" + i)
    
    return out

def generate_image(svg_path, out_path):
    com = "inkscape {} -o {}".format(
        escape(svg_path),
        escape(out_path)
    )
    print(com)
    os.system(com)

def gen_svg(origin, dest):
    files = gen_deque_files_from_path(origin, "svg")

    for file in files:
        origin_f = origin + "/" + file
        dest_f = dest + "/" + file.replace(".svg",".png")
        print("{} -> {}".format(origin_f, dest_f))
        generate_image(
            origin_f,
            dest_f
        )

if __name__ == "__main__":
    origin = "."
    dest = "../ressources"

    if len(sys.argv) > 1:
        origin = sys.argv[1]
    else:
        print("No input path given, using {}".format(origin))

    if len(sys.argv) > 2:
        dest = sys.argv[2]
    else:
        print("No output path given, using {}".format(dest))
    
    gen_svg(origin, dest)