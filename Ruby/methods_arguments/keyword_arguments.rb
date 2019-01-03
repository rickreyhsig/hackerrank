# Your code here
def convert_temp(input_tmp, input_scale: 'kelvin', output_scale: 'celsius')
    return input_tmp if input_scale == output_scale
    output_tmp = nil
    if input_scale == 'fahrenheit'
      output_tmp = ((input_tmp - 32) * 5.0/9.0) if output_scale == 'celsius'
      output_tmp = ((input_tmp - 32) * 5.0/9.0 + 273.15) if output_scale == 'kelvin'
    elsif input_scale == 'celsius'
      output_tmp = ((input_tmp * 9.0/5.0) + 32) if output_scale == 'fahrenheit'
      output_tmp = (input_tmp + 273.15) if output_scale == 'kelvin'
    elsif input_scale == 'kelvin'
      output_tmp = ((input_tmp - 273.15) * 9.0/5.0 + 32) if output_scale == 'fahrenheit'
      output_tmp = (input_tmp - 273.15) if output_scale == 'celsius'
    end
    return output_tmp.to_f
end
