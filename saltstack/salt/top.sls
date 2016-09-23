# This 'top.sls' has been customized specifically for the acdl-theme project.
# As such, all states are specified under the wildcard glob.
base:
  '*':
    - theme_dev

# TODO Determine the full set of states necessary and the desired state hierarchy